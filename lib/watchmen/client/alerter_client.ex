defmodule Watchmen.AlerterClient do
  @moduledoc """
  A client for the alerter (https://github.com/corka149/alerter).
  """

  @doc """
  Turns on the green traffic light.
  """
  def activate_green_light(address, tar_port) when is_integer(tar_port) do
    open_socket(0)
    |> send_and_close(address, tar_port, "green\n")
  end

  @doc """
  Turns on the yellow traffic light.
  """
  def activate_yellow_light(address, tar_port) when is_integer(tar_port) do
    open_socket(0)
    |> send_and_close(address, tar_port, "yellow\n")
  end


  @doc """
  Turns on the red traffic light.
  """
  def activate_red_light(address, tar_port) when is_integer(tar_port) do
    open_socket(0)
    |> send_and_close(address, tar_port, "red\n")
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
