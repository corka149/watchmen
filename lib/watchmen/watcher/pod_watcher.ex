defmodule Watchmen.PodWatcher do
  use GenServer

  require Logger

  alias Kazan.Watcher
  alias Watchmen.ContainerUtils
  alias Watchmen.AlerterClient

  @target_address {172, 31, 165, 193}
  @target_port 4040

      # # # # # #
    # Client  #
  # # # # # #

  def start_link(init_args) when is_list(init_args) do
    GenServer.start(__MODULE__, init_args)
  end

      # # # # # #
    # Server  #
  # # # # # #

  @impl true
  def init(_init_args) do
    Kazan.Apis.Core.V1.list_namespaced_pod!("playground")
    |> Kazan.Watcher.start_link(send_to: self())
    {:ok, []}
  end

  # type is `:added`, `:deleted`, `:modified` or `:gone`
  @impl true
  def handle_info(%Watcher.Event{object: object, type: type}, state) do

    case object do
      %Kazan.Apis.Core.V1.Pod{metadata: %{name: pod_name}} = pod->
        Watchmen.PodUtils.pod_container_statuses(pod)
        |> notify_state_change()

        Logger.info "pod_name=#{pod_name} -> event type=#{type}"
    end

    {:noreply, state}
  end

  defp notify_state_change(container_statuses) do
    cond do
      is_anybody_running?(container_statuses)     -> AlerterClient.activate_green_light(@target_address, @target_port)
      is_anybody_waiting?(container_statuses)     -> AlerterClient.activate_yellow_light(@target_address, @target_port)
      is_anybody_terminating?(container_statuses) -> AlerterClient.activate_red_light(@target_address, @target_port)
      true                                        -> Logger.info "No matching state found."
    end
  end

  defp is_anybody_running?(container_statuses) do
    container_statuses|> Enum.any?(&ContainerUtils.is_running?/1)
  end

  defp is_anybody_waiting?(container_statuses) do
    container_statuses |> Enum.any?(&ContainerUtils.is_waiting?/1)
  end

  defp is_anybody_terminating?(container_statuses) do
    container_statuses |> Enum.any?(&ContainerUtils.is_terminated?/1)
  end
end
