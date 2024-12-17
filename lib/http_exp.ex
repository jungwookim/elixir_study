defmodule HttpExp do
  use HTTPoison.Base

  def call_example(url) do
    get!(url)
  end

  def dummy_fn do
    dbg("dummy_fn")
  end
end
