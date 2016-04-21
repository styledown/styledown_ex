defmodule Styledown do
  @moduledoc """
  Elixir integration of Styledown.
  """

  @js_source Path.join(~w(#{File.cwd!} vendor styledown.js))

  @doc ~S"""
  Returns a string parsed by Styledown.

  ## Example

      iex> Styledown.parse("### hi")
      "<section class=\"sg-block sg-section-hi\">\n  <h3 id=\"hi\" class=\"sg\">hi</h3>\n</section>"
  """
  def parse(code, opts \\ [])

  def parse([h|_t] = code, opts) when is_binary(h) do
    code
    |> Enum.map(&(%{"name" => &1, "data" => File.read!(&1)}))
    |> do_parse(opts)
  end

  def parse(code, opts), do: do_parse(code, opts)

  defp do_parse(code, opts) do
    opts = Map.new(opts, &(&1))
    Execjs.call context, "Styledown.parse", [code, opts]
  end

  @doc """
  Returns the styledown.js version.

  ## Example

      iex> Styledown.js_version
      "1.0.1"
  """
  def js_version, do: Execjs.eval source <> "Styledown.version"

  defp source, do: File.read! @js_source

  defp context, do: Execjs.compile source
end
