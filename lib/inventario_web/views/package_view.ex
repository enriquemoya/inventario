defmodule InventarioWeb.PackageView do
  use InventarioWeb, :view
  alias InventarioWeb.PackageView

  def render("index.json", %{packages: packages}) do
    %{data: render_many(packages, PackageView, "package.json")}
  end

  def render("show.json", %{package: package}) do
    %{data: render_one(package, PackageView, "package.json")}
  end

  def render("package.json", %{package: package}) do
    %{id: package.id,
      stowage: package.stowage,
      weight: package.weight,
      width: package.width,
      length: package.length,
      height: package.height,
      prefer: package.prefer}
  end
end
