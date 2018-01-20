defmodule Inventario.ZoneTest do
  use Inventario.DataCase

  alias Inventario.Zone

  describe "types" do
    alias Inventario.Zone.Types

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def types_fixture(attrs \\ %{}) do
      {:ok, types} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Zone.create_types()

      types
    end

    test "list_types/0 returns all types" do
      types = types_fixture()
      assert Zone.list_types() == [types]
    end

    test "get_types!/1 returns the types with given id" do
      types = types_fixture()
      assert Zone.get_types!(types.id) == types
    end

    test "create_types/1 with valid data creates a types" do
      assert {:ok, %Types{} = types} = Zone.create_types(@valid_attrs)
      assert types.name == "some name"
    end

    test "create_types/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Zone.create_types(@invalid_attrs)
    end

    test "update_types/2 with valid data updates the types" do
      types = types_fixture()
      assert {:ok, types} = Zone.update_types(types, @update_attrs)
      assert %Types{} = types
      assert types.name == "some updated name"
    end

    test "update_types/2 with invalid data returns error changeset" do
      types = types_fixture()
      assert {:error, %Ecto.Changeset{}} = Zone.update_types(types, @invalid_attrs)
      assert types == Zone.get_types!(types.id)
    end

    test "delete_types/1 deletes the types" do
      types = types_fixture()
      assert {:ok, %Types{}} = Zone.delete_types(types)
      assert_raise Ecto.NoResultsError, fn -> Zone.get_types!(types.id) end
    end

    test "change_types/1 returns a types changeset" do
      types = types_fixture()
      assert %Ecto.Changeset{} = Zone.change_types(types)
    end
  end

  describe "zones" do
    alias Inventario.Zone.Zones

    @valid_attrs %{code: "some code", name: "some name", points: %{}}
    @update_attrs %{code: "some updated code", name: "some updated name", points: %{}}
    @invalid_attrs %{code: nil, name: nil, points: nil}

    def zones_fixture(attrs \\ %{}) do
      {:ok, zones} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Zone.create_zones()

      zones
    end

    test "list_zones/0 returns all zones" do
      zones = zones_fixture()
      assert Zone.list_zones() == [zones]
    end

    test "get_zones!/1 returns the zones with given id" do
      zones = zones_fixture()
      assert Zone.get_zones!(zones.id) == zones
    end

    test "create_zones/1 with valid data creates a zones" do
      assert {:ok, %Zones{} = zones} = Zone.create_zones(@valid_attrs)
      assert zones.code == "some code"
      assert zones.name == "some name"
      assert zones.points == %{}
    end

    test "create_zones/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Zone.create_zones(@invalid_attrs)
    end

    test "update_zones/2 with valid data updates the zones" do
      zones = zones_fixture()
      assert {:ok, zones} = Zone.update_zones(zones, @update_attrs)
      assert %Zones{} = zones
      assert zones.code == "some updated code"
      assert zones.name == "some updated name"
      assert zones.points == %{}
    end

    test "update_zones/2 with invalid data returns error changeset" do
      zones = zones_fixture()
      assert {:error, %Ecto.Changeset{}} = Zone.update_zones(zones, @invalid_attrs)
      assert zones == Zone.get_zones!(zones.id)
    end

    test "delete_zones/1 deletes the zones" do
      zones = zones_fixture()
      assert {:ok, %Zones{}} = Zone.delete_zones(zones)
      assert_raise Ecto.NoResultsError, fn -> Zone.get_zones!(zones.id) end
    end

    test "change_zones/1 returns a zones changeset" do
      zones = zones_fixture()
      assert %Ecto.Changeset{} = Zone.change_zones(zones)
    end
  end
end
