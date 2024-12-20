defmodule EndpointsApp do
  @moduledoc """
  A simple Elixir application with a couple of HTTP endpoints using Plug.

  This app provides the following HTTP routes:
  
  - `GET /ping`: Returns a simple pong message.
  - `GET /number/:number`: Returns a random even or odd number depending whether the param number is even or odd.
  - `GET /_`: Returns a 404 error for any undefined routes.

  ## Endpoints

  - **GET /ping**
    - **Response**: `200 OK`
    - **Body**: `{"message": "pong"}`

  - **GET /number/:number**
    - **Response**: `200 OK`
    - **Body**: `{"message": "<number>"}`

  - **GET /_** (catch-all)
    - **Response**: `404 Not Found`
    - **Body**: `{"message": "Endpoint not found"}`  
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
