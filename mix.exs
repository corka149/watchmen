defmodule Watchmen.MixProject do
  use Mix.Project

  def project do
    [
      app: :watchmen,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :kazan],
      mod: {Watchmen.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:kazan, "~> 0.11"},
    ]
  end
end
