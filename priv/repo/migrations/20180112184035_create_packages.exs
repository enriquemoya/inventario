defmodule Inventario.Repo.Migrations.CreatePackages do
  use Ecto.Migration

  def change do
    create table(:packages) do
      add :stowage, :integer
      add :weight, :float
      add :width, :float
      add :length, :float
      add :height, :float
      add :prefer, :boolean, default: false, null: false
      add :product_id, references(:products, on_delete: :nothing)

      timestamps()
    end

    create index(:packages, [:product_id])
  end
end
