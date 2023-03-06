defmodule TestApi.Cablist do
  @moduledoc """
  The Cablist context.
  """

  import Ecto.Query, warn: false
  alias TestApi.Repo

  alias TestApi.Cablist.Cab

  @doc """
  Returns the list of cabs.

  ## Examples

      iex> list_cabs()
      [%Cab{}, ...]

  """
  def list_cabs do
    Repo.all(Cab)
  end

  @doc """
  Gets a single cab.

  Raises `Ecto.NoResultsError` if the Cab does not exist.

  ## Examples

      iex> get_cab!(123)
      %Cab{}

      iex> get_cab!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cab!(id), do: Repo.get!(Cab, id)

  @doc """
  Creates a cab.

  ## Examples

      iex> create_cab(%{field: value})
      {:ok, %Cab{}}

      iex> create_cab(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cab(attrs \\ %{}) do
    %Cab{}
    |> Cab.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cab.

  ## Examples

      iex> update_cab(cab, %{field: new_value})
      {:ok, %Cab{}}

      iex> update_cab(cab, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cab(%Cab{} = cab, attrs) do
    cab
    |> Cab.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a cab.

  ## Examples

      iex> delete_cab(cab)
      {:ok, %Cab{}}

      iex> delete_cab(cab)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cab(%Cab{} = cab) do
    Repo.delete(cab)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cab changes.

  ## Examples

      iex> change_cab(cab)
      %Ecto.Changeset{data: %Cab{}}

  """
  def change_cab(%Cab{} = cab, attrs \\ %{}) do
    Cab.changeset(cab, attrs)
  end
end
