defmodule Inventario.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset
  alias Inventario.Products.Product
  alias Inventario.Products.Package


  schema "products" do
    field :code, :string
    field :description, :string
    field :name, :string
    has_many :packages, Package

    timestamps()
  end

  @doc false
  def changeset(%Product{} = product, attrs) do
    product
    |> cast(attrs, [:name, :code, :description])
    |> validate_required([:name, :code, :description])
  end
end
