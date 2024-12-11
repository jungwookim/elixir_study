defmodule MacroMisc1Test do
  use ExUnit.Case

  defmodule Example do
    use MacroMisc1
  end

  defmodule Example2 do
    use MacroMisc1

    def my_value, do: :example2_value
  end

  test "call default value" do
    assert Example.call_my_value() == :default_value
  end

  test "call my value" do
    assert Example2.call_my_value() == :example2_value
  end
end
