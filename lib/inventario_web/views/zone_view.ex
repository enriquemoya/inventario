defmodule InventarioWeb.ZoneView do
  use InventarioWeb, :view
  alias InventarioWeb.ZoneView

  def render("index.json", %{zones: zones}) do
    %{data: render_many(zones, ZoneView, "zone.json")}
  end

  def render("show.json", %{zone: zone}) do
    %{data: render_one(zone, ZoneView, "zone.json")}
  end

  def render("zone.json", %{zone: zone}) do
    %{id: zone.id,
      points: zone.points,
      code: zone.code,
      name: zone.name}
  end
end
