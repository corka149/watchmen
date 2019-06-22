defmodule Watchmen.PodWatcher do
  alias Kazan.Watcher

  require Logger

  use GenServer

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
        states = Watchmen.PodUtils.pod_container_statuses(pod)
                  |> Enum.map(&Watchmen.ContainerUtils.current_state/1)
        IO.inspect states
        Logger.info "pod_name=#{pod_name} -> event type=#{type}"
    end

    {:noreply, state}
  end

end
