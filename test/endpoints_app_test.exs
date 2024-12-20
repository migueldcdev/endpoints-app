defmodule EndpointsAppTest do
  use ExUnit.Case
  doctest EndpointsApp

  test "greets the world" do
    assert EndpointsApp.hello() == :world
  end
end
