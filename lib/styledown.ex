defmodule Styledown do
  @moduledoc """
  Elixir integration of Styledown.
  """

  @external_resource js_source = Path.join(~w(#{File.cwd!} vendor styledown.js))
  @js_source js_source

  @doc ~S"""
  Takes a string or a list of files and returns a string parsed by the
  Styledown Javascript library.

  ## Example

      iex> Styledown.parse("### hi")
      "<section class=\"sg-block sg-section-hi\">\n  <h3 id=\"hi\" class=\"sg\">hi</h3>\n</section>"

  Given you have directory named `stylesheets` with the files `app.css` and
  `config.md`:

      Path.wildcard("stylesheets/*.{css,md}")
      |> Styledown.parse
      |> File.write!("styledown.html")

  """
  def parse(content, opts \\ [])

  def parse([h|_t] = content, opts) when is_binary(h) do
    content
    |> Enum.map(&(%{"name" => &1, "data" => File.read!(&1)}))
    |> do_parse(opts)
  end

  def parse(content, opts), do: do_parse(content, opts)

  defp do_parse(content, opts) do
    opts = Map.new(opts, &(&1))
    Execjs.call context, "Styledown.parse", [content, opts]
  end

  @doc """
  Returns the version of the bundled Styledown Javascript library.

  ## Example

      iex> Styledown.js_version
      "1.0.1"
  """
  def js_version, do: Execjs.eval source <> "Styledown.version"

  defp source, do: File.read! @js_source

  defp context, do: Execjs.compile source
end
