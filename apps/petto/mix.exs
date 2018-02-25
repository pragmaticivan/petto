defmodule Petto.Mixfile do
  use Mix.Project

  def project do
    [
      app: :petto,
      version: "0.0.1",
      elixir: "~> 1.6.1",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Petto.Application, []},
      extra_applications: [
        :logger,
        :runtime_tools,
        :phoenix,
        :cowboy,
        :logger,
        :gettext,
        :ex_machina,
        :phoenix_ecto,
        :authable,
        :shield_notifier
      ]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(:dev), do: ["lib", "test/support/factory.ex"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:authable, "~> 0.9.1"},
      {:cors_plug, "~> 1.5"},
      {:shield_notifier, "~> 0.2.0"},
      {:phoenix, "~> 1.3.0"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_ecto, "~> 3.2"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 2.10"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:gettext, "~> 0.11"},
      {:poison, "~> 2.0 or ~> 3.0 or ~> 3.1"},
      {:ex_machina, "~> 2.1"},
      {:faker, "~> 0.9.0"},
      {:credo, "~> 0.6.1", only: :dev},
      {:ex_doc, ">= 0.14.5", only: :dev},
      {:cowboy, "~> 1.0"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": [
        "ecto.create",
        "ecto.migrate",
        "run priv/repo/seeds.exs"
      ],
      "ecto.reset": [
        "ecto.drop",
        "ecto.setup"
      ],
      test: [
        "ecto.create --quiet",
        "ecto.migrate",
        "test"
      ]
    ]
  end
end
