defmodule ElixirStudyTest do
  use ExUnit.Case
  doctest ElixirStudy

  test "greets the world" do
    assert ElixirStudy.hello() == :world
  end
end
