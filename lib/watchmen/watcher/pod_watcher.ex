defmodule Watchmen.PodWatcher do
  alias Kazan.Watcher

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
      %Kazan.Apis.Core.V1.Pod{} = pod ->
        %{metadata: %{name: pod_name}} = pod
        IO.puts "pod_name=#{pod_name} -> type=#{type}"
    end

    {:noreply, state}
  end

end
