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
    |> mapToPoints(attrs)
    |> cast(attrs, [:points, :code, :name])
    |> validate_required([:points, :code, :name])
  end

  defp mapToPoints(changeset,attrs) do
    if Map.has_key?(attrs, "map") do
      point = []
      Enum.each(attrs["map"],fn item ->
        case item do
          %{"x" => x,"y"=> y} -> point ++ [{x,y}]
          _ -> changeset = add_error(changeset,:points,"Empty")
        end
      end)
      if(length(changeset.errors) > 0) do
        changeset
        #else
      else
        put_change(changeset,:points,%{type: "Polygon", coordinates: point})
      end
      #else
      else
        changeset
    end
  end
end
