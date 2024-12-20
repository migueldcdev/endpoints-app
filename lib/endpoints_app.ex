defmodule EndpointsApp do
  @moduledoc """
  Documentation for `EndpointsApp`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> EndpointsApp.hello()
      :world

  """

  import Plug.Conn

  def init(options) do
    options
  end

  def call(conn, _opts) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Hello world\n")
  end

end
