defmodule EndpointsApp do
  @moduledoc """
  Elixir app with a couple of endpoints.
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
    response = %{:message => "Pong!"}
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, Jason.encode!(response))
  end

  get "number/:param" do

    number = String.to_integer(param)    

    message = case rem(number, 2) do
      0 -> Utils.random_even_number()
      _ -> Utils.random_odd_number()
    end

    response = %{:message => message}

    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, Jason.encode!(response))
  end

  match _ do
    response = %{:message => "Endpoint not found"}
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(404, Jason.encode!(response))
  end
end
