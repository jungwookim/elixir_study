defmodule MacroMisc1 do
  defmacro __before_compile__(_) do
    quote do
      unless Module.defines?(__MODULE__, {:my_value, 0}) do
        def my_value do
          :default_value
        end
      end
    end
  end

  defmacro __using__(_) do
    quote do
      # before_compile is mandatory
      @before_compile unquote(__MODULE__)
      def call_my_value, do: my_value()
    end
  end
end
