defmodule Watchmen.Client.WatchmenClient do

  @callback activate_running_state([String.t]) :: :ok | {:error, String.t}
  @callback activate_waiting_state([String.t]) :: :ok | {:error, String.t}
  @callback activate_terminating_state([String.t]) :: :ok | {:error, String.t}

end
