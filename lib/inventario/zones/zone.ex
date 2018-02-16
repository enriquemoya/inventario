defmodule Inventario.Zones.Zone do
  use Ecto.Schema
  import Ecto.Changeset
  alias Inventario.Zones.Zone


  schema "zones" do
    field :code, :string
    field :name, :string
    field :points, :map
    field :types_id, :id
    field :mapData, :map, virtual: true

    timestamps()
  end

  @doc false
  def changeset(%Zone{} = zone, attrs) do
    zone
    |> cast(attrs, [:points, :code, :name,:types_id])
    |>mapToPoints
    |> validate_required([:points, :code, :name,:types_id])
  end

  def view_changeset(%Zone{} = zone) do
    zone
    |> mapToPoints
  end
  defp mapToPoints(changeset) do
    if Map.has_key?(changeset,:points) do
      point = []
      hasError = false
      Enum.each(Map.get(changeset.points, "coordinates"),fn item ->
        case item do
          %{"x" => _, "y" => _ } ->
            hasError
          _ ->
          hasError = true
        end
      end)
      if(hasError) do
        add_error(changeset, :points, "Empty")
        #else
      else
        points = Enum.map(Map.get(changeset.points, "coordinates"), fn %{"x" => x,"y"=> y} -> {x,y} end)
        mapData = %{type: "Polygon", coordinates: points}
        changeset = change(changeset, mapData: mapData )
      end
      #else
      else
        changeset
    end
  end
end
