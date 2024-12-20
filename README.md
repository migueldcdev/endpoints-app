# Elixir Application with HTTP Endpoints Using Plug

A simple Elixir application with a couple of HTTP endpoints using Plug.

This app provides the following HTTP routes:

- `GET /ping`: Returns a simple pong message.
- `GET /number/:number`: Returns a random even or odd number depending on whether the parameter `number` is even or odd.
- `GET /_`: Returns a 404 error for any undefined routes.