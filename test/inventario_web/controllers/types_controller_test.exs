defmodule InventarioWeb.TypesControllerTest do
  use InventarioWeb.ConnCase

  alias Inventario.Zones
  alias Inventario.Zones.Types

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:types) do
    {:ok, types} = Zones.create_types(@create_attrs)
    types
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all types", %{conn: conn} do
      conn = get conn, types_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create types" do
    test "renders types when data is valid", %{conn: conn} do
      conn = post conn, types_path(conn, :create), types: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, types_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some name"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, types_path(conn, :create), types: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update types" do
    setup [:create_types]

    test "renders types when data is valid", %{conn: conn, types: %Types{id: id} = types} do
      conn = put conn, types_path(conn, :update, types), types: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, types_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some updated name"}
    end

    test "renders errors when data is invalid", %{conn: conn, types: types} do
      conn = put conn, types_path(conn, :update, types), types: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete types" do
    setup [:create_types]

    test "deletes chosen types", %{conn: conn, types: types} do
      conn = delete conn, types_path(conn, :delete, types)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, types_path(conn, :show, types)
      end
    end
  end

  defp create_types(_) do
    types = fixture(:types)
    {:ok, types: types}
  end
end
