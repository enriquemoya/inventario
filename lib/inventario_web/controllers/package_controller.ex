defmodule InventarioWeb.PackageController do
  use InventarioWeb, :controller

  alias Inventario.Products
  alias Inventario.Products.Package

  action_fallback InventarioWeb.FallbackController

  def index(conn, _params) do
    packages = Products.list_packages()
    render(conn, "index.json", packages: packages)
  end

  def create(conn, %{"package" => package_params}) do
    with {:ok, %Package{} = package} <- Products.create_package(package_params) do
      conn
      |> put_status(:created)
      |> render("show.json", package: package)
    end
  end

  def show(conn, %{"id" => id}) do
    package = Products.get_package!(id)
    render(conn, "show.json", package: package)
  end

  def update(conn, %{"id" => id, "package" => package_params}) do
    package = Products.get_package!(id)

    with {:ok, %Package{} = package} <- Products.update_package(package, package_params) do
      render(conn, "show.json", package: package)
    end
  end

  def delete(conn, %{"id" => id}) do
    package = Products.get_package!(id)
    with {:ok, %Package{}} <- Products.delete_package(package) do
      send_resp(conn, :no_content, "")
    end
  end
end
