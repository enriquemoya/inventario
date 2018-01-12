defmodule Inventario.Products.Package do
  use Ecto.Schema
  import Ecto.Changeset
  alias Inventario.Products.Package
  alias Inventario.Products.Product


  schema "packages" do
    field :height, :float
    field :length, :float
    field :prefer, :boolean, default: false
    field :stowage, :integer
    field :weight, :float
    field :width, :float
    belongs_to :product, Product

    timestamps()
  end

  @doc false
  def changeset(%Package{} = package, attrs) do
    package
    |> cast(attrs, [:stowage, :weight, :width, :length, :height, :prefer,:product_id])
    |> validate_required([:stowage, :weight, :width, :length, :height, :prefer,:product_id])
    |> foreign_key_constraint(:product_id)
  end
end
