defmodule Inventario.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def up do
    create table(:products) do
      add :name, :string
      add :code, :string
      add :description, :string

      timestamps()
    end
    create unique_index(:products, [:code])

  end
  def down do
    drop table(:products)
  end
end
