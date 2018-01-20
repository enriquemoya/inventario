defmodule InventarioWeb.TypesController do
  use InventarioWeb, :controller

  alias Inventario.Zones
  alias Inventario.Zones.Types

  action_fallback InventarioWeb.FallbackController

  def index(conn, _params) do
    types = Zones.list_types()
    render(conn, "index.json", types: types)
  end

  def create(conn, %{"types" => types_params}) do
    with {:ok, %Types{} = types} <- Zones.create_types(types_params) do
      conn
      |> put_status(:created)
      |> render("show.json", types: types)
    end
  end

  def show(conn, %{"id" => id}) do
    types = Zones.get_types!(id)
    render(conn, "show.json", types: types)
  end

  def update(conn, %{"id" => id, "types" => types_params}) do
    types = Zones.get_types!(id)

    with {:ok, %Types{} = types} <- Zones.update_types(types, types_params) do
      render(conn, "show.json", types: types)
    end
  end

  def delete(conn, %{"id" => id}) do
    types = Zones.get_types!(id)
    with {:ok, %Types{}} <- Zones.delete_types(types) do
      send_resp(conn, :no_content, "")
    end
  end
end
