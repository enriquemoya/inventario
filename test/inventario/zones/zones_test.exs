defmodule Inventario.ZonesTest do
  use Inventario.DataCase

  alias Inventario.Zones

  describe "types" do
    alias Inventario.Zones.Types

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def types_fixture(attrs \\ %{}) do
      {:ok, types} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Zones.create_types()

      types
    end

    test "list_types/0 returns all types" do
      types = types_fixture()
      assert Zones.list_types() == [types]
    end

    test "get_types!/1 returns the types with given id" do
      types = types_fixture()
      assert Zones.get_types!(types.id) == types
    end

    test "create_types/1 with valid data creates a types" do
      assert {:ok, %Types{} = types} = Zones.create_types(@valid_attrs)
      assert types.name == "some name"
    end

    test "create_types/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Zones.create_types(@invalid_attrs)
    end

    test "update_types/2 with valid data updates the types" do
      types = types_fixture()
      assert {:ok, types} = Zones.update_types(types, @update_attrs)
      assert %Types{} = types
      assert types.name == "some updated name"
    end

    test "update_types/2 with invalid data returns error changeset" do
      types = types_fixture()
      assert {:error, %Ecto.Changeset{}} = Zones.update_types(types, @invalid_attrs)
      assert types == Zones.get_types!(types.id)
    end

    test "delete_types/1 deletes the types" do
      types = types_fixture()
      assert {:ok, %Types{}} = Zones.delete_types(types)
      assert_raise Ecto.NoResultsError, fn -> Zones.get_types!(types.id) end
    end

    test "change_types/1 returns a types changeset" do
      types = types_fixture()
      assert %Ecto.Changeset{} = Zones.change_types(types)
    end
  end

  describe "zones" do
    alias Inventario.Zones.Zone

    @valid_attrs %{code: "some code", name: "some name", points: %{}}
    @update_attrs %{code: "some updated code", name: "some updated name", points: %{}}
    @invalid_attrs %{code: nil, name: nil, points: nil}

    def zone_fixture(attrs \\ %{}) do
      {:ok, zone} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Zones.create_zone()

      zone
    end

    test "list_zones/0 returns all zones" do
      zone = zone_fixture()
      assert Zones.list_zones() == [zone]
    end

    test "get_zone!/1 returns the zone with given id" do
      zone = zone_fixture()
      assert Zones.get_zone!(zone.id) == zone
    end

    test "create_zone/1 with valid data creates a zone" do
      assert {:ok, %Zone{} = zone} = Zones.create_zone(@valid_attrs)
      assert zone.code == "some code"
      assert zone.name == "some name"
      assert zone.points == %{}
    end

    test "create_zone/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Zones.create_zone(@invalid_attrs)
    end

    test "update_zone/2 with valid data updates the zone" do
      zone = zone_fixture()
      assert {:ok, zone} = Zones.update_zone(zone, @update_attrs)
      assert %Zone{} = zone
      assert zone.code == "some updated code"
      assert zone.name == "some updated name"
      assert zone.points == %{}
    end

    test "update_zone/2 with invalid data returns error changeset" do
      zone = zone_fixture()
      assert {:error, %Ecto.Changeset{}} = Zones.update_zone(zone, @invalid_attrs)
      assert zone == Zones.get_zone!(zone.id)
    end

    test "delete_zone/1 deletes the zone" do
      zone = zone_fixture()
      assert {:ok, %Zone{}} = Zones.delete_zone(zone)
      assert_raise Ecto.NoResultsError, fn -> Zones.get_zone!(zone.id) end
    end

    test "change_zone/1 returns a zone changeset" do
      zone = zone_fixture()
      assert %Ecto.Changeset{} = Zones.change_zone(zone)
    end
  end
end
