defmodule Inventario.Zones.Zone do
  use Ecto.Schema
  import Ecto.Changeset
  alias Inventario.Zones.Zone


  schema "zones" do
    field :code, :string
    field :name, :string
    field :points, :map
    field :types_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Zone{} = zone, attrs) do
    zone
    |> cast(attrs, [:points, :code, :name])
    |> validate_required([:points, :code, :name])
  end
end
