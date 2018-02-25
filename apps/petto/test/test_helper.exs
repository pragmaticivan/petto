ExUnit.start()
ExUnit.configure(trace: true)

{:ok, _} = Application.ensure_all_started(:ex_machina)

Ecto.Adapters.SQL.Sandbox.mode(Petto.Repo, :manual)
