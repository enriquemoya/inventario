defmodule InventarioWeb.ZonesControllerTest do
  use InventarioWeb.ConnCase

  alias Inventario.Zone
  alias Inventario.Zone.Zones

  @create_attrs %{code: "some code", name: "some name", points: %{}}
  @update_attrs %{code: "some updated code", name: "some updated name", points: %{}}
  @invalid_attrs %{code: nil, name: nil, points: nil}

  def fixture(:zones) do
    {:ok, zones} = Zone.create_zones(@create_attrs)
    zones
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all zones", %{conn: conn} do
      conn = get conn, zones_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create zones" do
    test "renders zones when data is valid", %{conn: conn} do
      conn = post conn, zones_path(conn, :create), zones: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, zones_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "code" => "some code",
        "name" => "some name",
        "points" => %{}}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, zones_path(conn, :create), zones: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update zones" do
    setup [:create_zones]

    test "renders zones when data is valid", %{conn: conn, zones: %Zones{id: id} = zones} do
      conn = put conn, zones_path(conn, :update, zones), zones: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, zones_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "code" => "some updated code",
        "name" => "some updated name",
        "points" => %{}}
    end

    test "renders errors when data is invalid", %{conn: conn, zones: zones} do
      conn = put conn, zones_path(conn, :update, zones), zones: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete zones" do
    setup [:create_zones]

    test "deletes chosen zones", %{conn: conn, zones: zones} do
      conn = delete conn, zones_path(conn, :delete, zones)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, zones_path(conn, :show, zones)
      end
    end
  end

  defp create_zones(_) do
    zones = fixture(:zones)
    {:ok, zones: zones}
  end
end
