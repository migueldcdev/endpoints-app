defmodule EndpointsApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Starts a worker by calling: EndpointsApp.Worker.start_link(arg)
      # {EndpointsApp.Worker, arg}
      {Plug.Cowboy, plug: EndpointsApp, scheme: :http, options: [port: 4000]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: EndpointsApp.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
