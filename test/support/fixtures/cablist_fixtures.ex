defmodule TestApi.CablistFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TestApi.Cablist` context.
  """

  @doc """
  Generate a unique cab id.
  """
  def unique_cab_id, do: "some id#{System.unique_integer([:positive])}"

  @doc """
  Generate a cab.
  """
  def cab_fixture(attrs \\ %{}) do
    {:ok, cab} =
      attrs
      |> Enum.into(%{
        description: "some description",
        id: unique_cab_id(),
        name: "some name"
      })
      |> TestApi.Cablist.create_cab()

    cab
  end

  @doc """
  Generate a unique cab cabid.
  """
  def unique_cab_cabid, do: "some cabid#{System.unique_integer([:positive])}"

  @doc """
  Generate a cab.
  """
  def cab_fixture(attrs \\ %{}) do
    {:ok, cab} =
      attrs
      |> Enum.into(%{
        cabid: unique_cab_cabid(),
        description: "some description",
        name: "some name"
      })
      |> TestApi.Cablist.create_cab()

    cab
  end
end
