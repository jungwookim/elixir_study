defmodule MockTest do
  use ExUnit.Case, async: false

  import Mock

  test "test_name" do
    with_mock HTTPoison, get: fn _url -> "<html></html>" end do
      assert "<html></html>" == HTTPoison.get("http://example.com")
    end
  end
end
