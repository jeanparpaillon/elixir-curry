defmodule Curry do
  @moduledoc """
  Provides `defc` macro for building curry functions
  """

  defmacro __using__(_opts) do
    quote do
      import unquote(__MODULE__)
    end
  end

  defmacro defc({name, _, args}, do: body) do
    acc0 = [def_complete(name, args, body)]
    def_partials(name, Enum.reverse(args), acc0)
  end

  defp def_complete(name, args, body) do
    quote do
      def unquote(name)(unquote_splicing(args)) do
        unquote(body)
      end
    end
  end

  defp def_partials(_name, [], acc) do
    acc
  end

  defp def_partials(name, [_ | args], acc) do
    [def_partial(name, Enum.reverse(args)) | def_partials(name, args, acc)]
  end

  defp def_partial(name, args) do
    quote do
      def unquote(name)(unquote_splicing(args)) do
        fn x ->
          unquote(name)(unquote_splicing(args), x)
        end
      end
    end
  end
end
