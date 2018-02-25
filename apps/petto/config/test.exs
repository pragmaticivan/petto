use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :petto, PettoWeb.Endpoint,
  http: [port: 4001],
  secret_key_base: "qutvH25cD6SmJDcU/XNMcfHhB7RrOye+mYjjq95R2G+Izr4b5LW4m71wBD8OZ2xL",
  server: false

config :petto, ShieldWeb.Endpoint,
  http: [port: 4001],
  secret_key_base: "YfOapYVW+HP0fv/xObEFlLQ/nwr3BiUkTy+4WDjRzx7uTV/9b+QAm4TLABZdqLUI",
  server: false

config :petto,
  confirmable: false

# Print only warnings and errors during test
config :logger, level: :warn

config :petto, sql_sandbox: true

# Configure your database
config :petto, Petto.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "petto",
  password: "petto",
  database: "petto_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :shield_notifier, Shield.Notifier.Mailer,
  adapter: Bamboo.TestAdapter
