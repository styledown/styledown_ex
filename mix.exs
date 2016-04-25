defmodule Styledown.Mixfile do
  use Mix.Project

  @version "0.0.1"

  def project do
    [
      app: :styledown,
      version: @version,
      elixir: "~> 1.2",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps,
      name: "Styledown",
      description: description,
      package: package,
      docs: docs
    ]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:execjs, "~> 1.1.3"},
      {:ex_doc, "~> 0.11", only: :docs},
      {:earmark, "~> 0.2", only: :docs}
    ]
  end

  defp description, do: "Elixir integration of Styledown"

  defp package do
    [
      maintainers: ["Victor Solis"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/styledown/styledown_ex",
        "Docs" => "http://hexdocs.pm/styledown"
      }
    ]
  end

  defp docs do
    [
      source_ref: "v#{@version}",
      main: "Styledown",
      canonical: "http://hexdocs.pm/styledown",
      source_url: "https://github.com/styledown/styledown_ex"
    ]
  end
end
