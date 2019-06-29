defmodule Watchmen.Client.AlerterClient do
  @behaviour Watchmen.Client.WatchmenClient

  @moduledoc """
  A client for the alerter (https://github.com/corka149/alerter).
  """

  @target_address {172, 31, 165, 193}
  @target_port 4040

  @doc """
  Turns on the green traffic light.
  """
  def activate_running_state(_container_names) do
    open_socket(0)
    |> send_and_close(@target_address,  @target_port, "green\n")
    :ok
  end

  @doc """
  Turns on the yellow traffic light.
  """
  def activate_waiting_state(_container_names) do
    open_socket(0)
    |> send_and_close(@target_address,  @target_port, "yellow\n")
    :ok
  end


  @doc """
  Turns on the red traffic light.
  """
  def activate_terminating_state(_container_names) do
    open_socket(0)
    |> send_and_close(@target_address,  @target_port, "red\n")
    :ok
  end

  defp open_socket(port) when is_integer(port) do
    case :gen_udp.open(port) do
      {:ok, socket} -> socket
      _             -> open_socket(port)
    end
  end

  defp send_and_close(socket, address, port, message) do
    :gen_udp.send(socket, address, port, message)
    :gen_udp.close(socket)
  end
end
