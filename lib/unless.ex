defmodule Unless do
  def fun_unless(clause, do: express) do
    if(!clause, do: express)
  end

  defmacro macro_unless(clause, do: expression) do
    # quote: returns the AST (abstract syntax tree) representation of the code
    quote do
      # Unquotes the given expression inside a quoted expression.
      # This function expects a valid Elixir AST,
      # also known as quoted expression, as argument.
      # If you would like to unquote any value, such as a map or a four-element tuple,
      # you should call Macro.escape/1 before unquoting.
      # https://hexdocs.pm/elixir/Kernel.SpecialForms.html#unquote/1
      if(!unquote(clause), do: unquote(expression))
    end
  end
end
