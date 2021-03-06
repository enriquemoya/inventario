defmodule Inventario.Repo.Migrations.CreateZones do
  use Ecto.Migration

  def change do
    create table(:zones) do
      add :points, :map
      add :code, :string
      add :name, :string
      add :height, :float
      add :types_id, references(:types, on_delete: :nothing)

      timestamps()
    end

    create index(:zones, [:types_id])
  end
end

#tomar en cuenta espacio entre filas para evitar golpet etc {seguridad}
