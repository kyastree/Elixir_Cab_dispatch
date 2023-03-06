defmodule TestApi.Repo.Migrations.CreateCabs do
  use Ecto.Migration

  def change do
    create table(:cabs) do
      add :id, :string
      add :description, :string
      add :name, :string

      timestamps()
    end

    create unique_index(:cabs, [:id])
  end
end
