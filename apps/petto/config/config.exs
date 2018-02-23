# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :petto, ecto_repos: [Petto.Repo]

# Configures the endpoint
config :petto, PettoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qutvH25cD6SmJDcU/XNMcfHhB7RrOye+mYjjq95R2G+Izr4b5LW4m71wBD8OZ2xL",
  render_errors: [view: PettoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Petto.PubSub, adapter: Phoenix.PubSub.PG2]

config :petto, ShieldWeb.Endpoint,
  render_errors: [view: ShieldWeb.ErrorView, accepts: ~w(html json)]

config :authable,
  ecto_repos: [Petto.Repo],
  repo: Petto.Repo,
  resource_owner: Authable.Model.User,
  token_store: Authable.Model.Token,
  client: Authable.Model.Client,
  app: Authable.Model.App,
  expires_in: %{
    access_token: 3600,
    refresh_token: 24 * 3600,
    authorization_code: 300,
    session_token: 30 * 24 * 3600
  },
  grant_types: %{
    authorization_code: Authable.GrantType.AuthorizationCode,
    client_credentials: Authable.GrantType.ClientCredentials,
    password: Authable.GrantType.Password,
    refresh_token: Authable.GrantType.RefreshToken
  },
  auth_strategies: %{
    headers: %{
      "authorization" => [
        {~r/Basic ([a-zA-Z\-_\+=]+)/, Authable.Authentication.Basic},
        {~r/Bearer ([a-zA-Z\-_\+=]+)/, Authable.Authentication.Bearer}
      ],
      "x-api-token" => [
        {~r/([a-zA-Z\-_\+=]+)/, Authable.Authentication.Bearer}
      ]
    },
    query_params: %{
      "access_token" => Authable.Authentication.Bearer
    },
    sessions: %{
      "session_token" => Authable.Authentication.Session
    }
  },
  scopes: ~w(read write session),
  renderer: Authable.Renderer.RestApi

config :petto,
  confirmable: true,
  otp_check: false,
  hooks: Shield.Hook.Default,
  views: %{
    changeset: ShieldWeb.ChangesetView,
    error: ShieldWeb.ErrorView,
    app: ShieldWeb.AppView,
    client: ShieldWeb.ClientView,
    token: ShieldWeb.TokenView,
    user: ShieldWeb.UserView
  },
  cors_origins: "http://localhost:4200, *",
  front_end: %{
    base: "http://localhost:4200",
    confirmation_path: "/users/confirm?confirmation_token={{confirmation_token}}",
    reset_password_path: "/users/reset-password?reset_token={{reset_token}}"
  }

config :shield_notifier,
  channels: %{
    email: %{
      from: %{
        name: {:system, "APP_NAME", "Shield Notifier"},
        email: {:system, "APP_FROM_EMAIL", "no-reply@localhost"}
      }
    }
  }

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
