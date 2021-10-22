# ElixirLambda

Provides lambda programming stuffs for elixir

## Curry functions

Defines:

```
defmodule Partial do
  @moduledoc false
  use Curry

  defc f(a, b, c, d, e) do
    %{a: a, b: b, c: c, d: d, e: e}
  end
end
```

Call:

```
f_a = Partial.f(1)
f_a_b = f_a(2)

%{a: 1, b: 2, c: 3, d: 4, e: 5} = f_a_b.(3).(4).(5)
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `elixir_lambda` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:elixir_lambda, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/elixir_lambda](https://hexdocs.pm/elixir_lambda).

