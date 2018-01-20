defmodule InventarioWeb.TypesView do
  use InventarioWeb, :view
  alias InventarioWeb.TypesView

  def render("index.json", %{types: types}) do
    %{data: render_many(types, TypesView, "types.json")}
  end

  def render("show.json", %{types: types}) do
    %{data: render_one(types, TypesView, "types.json")}
  end

  def render("types.json", %{types: types}) do
    %{id: types.id,
      name: types.name}
  end
end
