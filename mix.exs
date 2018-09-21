defmodule Bitcoin.Mixfile do
  use Mix.Project

  def project do
    [
      app: :bitcoin,
      version: "0.0.3",
      elixir: "~> 1.7",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: [plt_add_deps: true]
    ]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [
      mod: {Bitcoin, []},
      applications: [:logger]
      # :ecto and :postgrex apps are started by the Postgres storage engine when necessary
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      # Binary handling
      {:binary, "0.0.5"}
    ]
  end
end
