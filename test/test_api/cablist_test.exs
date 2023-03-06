defmodule TestApi.CablistTest do
  use TestApi.DataCase

  alias TestApi.Cablist

  describe "cabs" do
    alias TestApi.Cablist.Cab

    import TestApi.CablistFixtures

    @invalid_attrs %{description: nil, id: nil, name: nil}

    test "list_cabs/0 returns all cabs" do
      cab = cab_fixture()
      assert Cablist.list_cabs() == [cab]
    end

    test "get_cab!/1 returns the cab with given id" do
      cab = cab_fixture()
      assert Cablist.get_cab!(cab.id) == cab
    end

    test "create_cab/1 with valid data creates a cab" do
      valid_attrs = %{description: "some description", id: "some id", name: "some name"}

      assert {:ok, %Cab{} = cab} = Cablist.create_cab(valid_attrs)
      assert cab.description == "some description"
      assert cab.id == "some id"
      assert cab.name == "some name"
    end

    test "create_cab/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cablist.create_cab(@invalid_attrs)
    end

    test "update_cab/2 with valid data updates the cab" do
      cab = cab_fixture()
      update_attrs = %{description: "some updated description", id: "some updated id", name: "some updated name"}

      assert {:ok, %Cab{} = cab} = Cablist.update_cab(cab, update_attrs)
      assert cab.description == "some updated description"
      assert cab.id == "some updated id"
      assert cab.name == "some updated name"
    end

    test "update_cab/2 with invalid data returns error changeset" do
      cab = cab_fixture()
      assert {:error, %Ecto.Changeset{}} = Cablist.update_cab(cab, @invalid_attrs)
      assert cab == Cablist.get_cab!(cab.id)
    end

    test "delete_cab/1 deletes the cab" do
      cab = cab_fixture()
      assert {:ok, %Cab{}} = Cablist.delete_cab(cab)
      assert_raise Ecto.NoResultsError, fn -> Cablist.get_cab!(cab.id) end
    end

    test "change_cab/1 returns a cab changeset" do
      cab = cab_fixture()
      assert %Ecto.Changeset{} = Cablist.change_cab(cab)
    end
  end

  describe "cabs" do
    alias TestApi.Cablist.Cab

    import TestApi.CablistFixtures

    @invalid_attrs %{cabid: nil, description: nil, name: nil}

    test "list_cabs/0 returns all cabs" do
      cab = cab_fixture()
      assert Cablist.list_cabs() == [cab]
    end

    test "get_cab!/1 returns the cab with given id" do
      cab = cab_fixture()
      assert Cablist.get_cab!(cab.id) == cab
    end

    test "create_cab/1 with valid data creates a cab" do
      valid_attrs = %{cabid: "some cabid", description: "some description", name: "some name"}

      assert {:ok, %Cab{} = cab} = Cablist.create_cab(valid_attrs)
      assert cab.cabid == "some cabid"
      assert cab.description == "some description"
      assert cab.name == "some name"
    end

    test "create_cab/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cablist.create_cab(@invalid_attrs)
    end

    test "update_cab/2 with valid data updates the cab" do
      cab = cab_fixture()
      update_attrs = %{cabid: "some updated cabid", description: "some updated description", name: "some updated name"}

      assert {:ok, %Cab{} = cab} = Cablist.update_cab(cab, update_attrs)
      assert cab.cabid == "some updated cabid"
      assert cab.description == "some updated description"
      assert cab.name == "some updated name"
    end

    test "update_cab/2 with invalid data returns error changeset" do
      cab = cab_fixture()
      assert {:error, %Ecto.Changeset{}} = Cablist.update_cab(cab, @invalid_attrs)
      assert cab == Cablist.get_cab!(cab.id)
    end

    test "delete_cab/1 deletes the cab" do
      cab = cab_fixture()
      assert {:ok, %Cab{}} = Cablist.delete_cab(cab)
      assert_raise Ecto.NoResultsError, fn -> Cablist.get_cab!(cab.id) end
    end

    test "change_cab/1 returns a cab changeset" do
      cab = cab_fixture()
      assert %Ecto.Changeset{} = Cablist.change_cab(cab)
    end
  end
end
