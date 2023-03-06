defmodule TestApi.Repo.Migrations.CreateCabs do
  use Ecto.Migration

  def change do
    create table(:cabs) do
      add :cabid, :string
      add :description, :string
      add :name, :string

      timestamps()
    end

    create unique_index(:cabs, [:cabid])
  end
end
