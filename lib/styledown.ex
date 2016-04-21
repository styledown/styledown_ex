defmodule Styledown do
  @js_source Path.join(~w(#{File.cwd!} vendor styledown.js))

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

  def js_version, do: Execjs.eval source <> "Styledown.version"

  defp source, do: File.read! @js_source

  defp context, do: Execjs.compile source
end
