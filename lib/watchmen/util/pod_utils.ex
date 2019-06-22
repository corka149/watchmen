defmodule Watchmen.PodUtils do

  def pod_container_statuses(%Kazan.Apis.Core.V1.Pod{} = pod) do
    %{status: %{container_statuses: container_statuses}} = pod
    container_statuses
  end

end
