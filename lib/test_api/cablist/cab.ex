defmodule TestApi.Cablist.Cab do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cabs" do
    field :cabid, :string
    field :description, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(cab, attrs) do
    cab
    |> cast(attrs, [:cabid, :description, :name])
    |> validate_required([:cabid, :description, :name])
    |> unique_constraint(:cabid)
  end
end
