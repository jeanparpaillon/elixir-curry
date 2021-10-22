defmodule ElixirLambdaTest do
  use ExUnit.Case
  doctest ElixirLambda

  test "greets the world" do
    assert ElixirLambda.hello() == :world
  end
end
