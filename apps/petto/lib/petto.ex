defmodule Petto do
  @moduledoc """
  Petto keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Start the endpoint when the application starts
      supervisor(Shield, [])
      # Start the Ecto repository
      # supervisor(Shield.Repo, []),
      # Here you could define other workers and supervisors as children
      # worker(Shield.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Petto.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
