defmodule PettoWeb.StatusController do
  use PettoWeb, :controller

  def index(conn, _params) do
    json(conn, %{
      status: "ok"
    })
  end
end
