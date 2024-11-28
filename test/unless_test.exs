defmodule UnlessTest do
  use ExUnit.Case
  import Unless

  test "fun_unless works as expected" do
    assert fun_unless(false, do: "executed") == "executed"
    assert fun_unless(true, do: "executed") == nil
  end

  test "macro_unless works as expected" do
    assert macro_unless(false, do: "executed") == "executed"
    assert macro_unless(true, do: "executed") == nil
  end

  test "macro_unless generates correct code" do
    clause = quote do: false
    expression = quote do: "executed"

    expanded =
      Macro.expand_once(
        quote(do: macro_unless(unquote(clause), do: unquote(expression))),
        __ENV__
      )

    expected =
      quote do
        if !false do
          "executed"
        end
      end

    assert Macro.to_string(expanded) == Macro.to_string(expected)
  end
end
