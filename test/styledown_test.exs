defmodule StyledownTest do
  use ExUnit.Case, async: true
  doctest Styledown

  test "js_version returns the js version" do
    assert Styledown.js_version =~ ~r/^\d+\.\d+\.\d+/
  end

  test "parse returns the correct markup" do
    output = Styledown.parse("### hi")
    assert output =~ ~r/<h3[^>]+>hi<\/h3>/
  end

  test "parse with head option generates an HTML file" do
    output = Styledown.parse("### hi", head: "<meta>")

    assert output =~ ~r/<meta>/
    assert output =~ ~r/^<!doctype html>/
  end

  test "parse works with multiple files" do
    output = Styledown.parse([
      %{ name: "input.md",  data: "### hi from md" },
      %{ name: "input.css", data: "/**\n * hi from css:\n * world\n */" }
    ])

    assert output =~ ~r/<h3[^>]+>hi from md<\/h3>/
    assert output =~ ~r/<h3[^>]+>hi from css<\/h3>/
  end

  test "parse works with an array of paths" do
    output = Styledown.parse([
      "test/fixtures/sample.css",
      "test/fixtures/sample.md"
    ])

    assert output =~ ~r/Sample md block<\/h3>/
    assert output =~ ~r/Sample CSS block<\/h3>/
  end

end
