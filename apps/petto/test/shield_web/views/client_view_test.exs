
defmodule ShieldWeb.ClientViewTest do
  use ShieldWeb.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View
  import Shield.Factory
  alias ShieldWeb.ClientView

  setup do
    user = insert(:user)
    client = insert(:client, user: user)
    {:ok, user: user, client: client}
  end

  test "renders index.json", %{client: client} do
    assert render(ClientView, "index.json", %{clients: [client]}) ==
      %{clients: [%{
        id: client.id,
        name: client.name,
        redirect_uri: client.redirect_uri,
        secret: client.secret,
        settings: client.settings
      }]}
  end

  test "renders show.json", %{client: client} do
    assert render(ClientView, "show.json", %{client: client}) ==
      %{client: %{
        id: client.id,
        name: client.name,
        redirect_uri: client.redirect_uri,
        secret: client.secret,
        settings: client.settings
      }}
  end

  test "renders show.json if is_owner", %{client: client} do
    assert render(ClientView, "show.json", %{client: client, is_owner: true}) ==
      %{client: %{
        id: client.id,
        name: client.name,
        redirect_uri: client.redirect_uri,
        secret: client.secret,
        settings: client.settings
      }}
  end

  test "renders show.json unless is_owner", %{client: client} do
    assert render(ClientView, "show.json", %{client: client, is_owner: false}) ==
      %{client: %{
        id: client.id,
        name: client.name,
        redirect_uri: client.redirect_uri,
        settings: client.settings
      }}
  end

  test "renders show.json if is_owner is nil", %{client: client} do
    assert render(ClientView, "show.json", %{client: client, is_owner: nil}) ==
      %{client: %{
        id: client.id,
        name: client.name,
        redirect_uri: client.redirect_uri,
        settings: client.settings
      }}
  end

  test "renders client.json", %{client: client} do
    assert render(ClientView, "client.json", %{client: client}) ==
      %{
        id: client.id,
        name: client.name,
        redirect_uri: client.redirect_uri,
        secret: client.secret,
        settings: client.settings
      }
  end

  test "renders app_client.json", %{client: client} do
    assert render(ClientView, "app_client.json", %{client: client}) ==
      %{
        id: client.id,
        name: client.name,
        redirect_uri: client.redirect_uri,
        settings: client.settings
      }
  end
end
