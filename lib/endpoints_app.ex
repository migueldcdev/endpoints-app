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
  use Plug.Router

  plug :match
  plug :dispatch

  def init(options) do
    options
  end

  get "/ping" do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Pong!")
  end

  get "number/:param" do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "#{param}")
  end

  match _ do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(404, "Endpoint not found")
  end
end
