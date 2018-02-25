import Shield.Factory
alias Petto.Repo

alias Authable.Model.User
alias Authable.Model.Client

Faker.start

Repo.transaction(fn ->
  # Users
  Repo.delete_all(User)

  client_owner = insert(:user,
      email: "pragmaticivan@gmail.com",
      password: Comeonin.Bcrypt.hashpwsalt("123mudar"))

  # Clients
  Repo.delete_all(Client)

  insert(:client,
    name: "Web APP",
    user_id: client_owner.id
  )
end)
