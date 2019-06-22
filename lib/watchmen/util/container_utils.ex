defmodule Watchmen.ContainerUtils do

  @doc """
  Takes a container status struct and returns the current state to it.
  """
  def current_state(%Kazan.Apis.Core.V1.ContainerStatus{} = container_status) do
    %{state: %Kazan.Apis.Core.V1.ContainerState{} = container_state} = container_status
    container_state
  end


  @doc """
  Takes a container or its state and returns true when the container was terminated.
  """
  @spec is_terminated?(%{
          __struct__: Kazan.Apis.Core.V1.ContainerState | Kazan.Apis.Core.V1.ContainerStatus
        }) :: boolean
  def is_terminated?(%Kazan.Apis.Core.V1.ContainerStatus{} = container_status), do: current_state(container_status) |> is_terminated?()
  def is_terminated?(%Kazan.Apis.Core.V1.ContainerState{terminated: nil}), do: false
  def is_terminated?(%Kazan.Apis.Core.V1.ContainerState{terminated: _}), do: true


  @doc """
  Takes a container or its state and returns true when the container is running.
  """
  @spec is_running?(%{
          __struct__: Kazan.Apis.Core.V1.ContainerState | Kazan.Apis.Core.V1.ContainerStatus
        }) :: boolean
  def is_running?(%Kazan.Apis.Core.V1.ContainerStatus{} = container_status), do: current_state(container_status) |> is_running?()
  def is_running?(%Kazan.Apis.Core.V1.ContainerState{running: nil}), do: false
  def is_running?(%Kazan.Apis.Core.V1.ContainerState{running: _}), do: true


  @doc """
  Takes a container or its state and returns true when the container is running.
  """
  @spec is_waiting?(%{
          __struct__: Kazan.Apis.Core.V1.ContainerState | Kazan.Apis.Core.V1.ContainerStatus
        }) :: boolean
  def is_waiting?(%Kazan.Apis.Core.V1.ContainerStatus{} = container_status), do: current_state(container_status) |> is_waiting?()
  def is_waiting?(%Kazan.Apis.Core.V1.ContainerState{waiting: nil}), do: false
  def is_waiting?(%Kazan.Apis.Core.V1.ContainerState{waiting: _}), do: true
end
