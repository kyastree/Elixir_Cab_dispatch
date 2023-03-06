defmodule TestApiWeb.CabControllerTest do
  use TestApiWeb.ConnCase

  import TestApi.CablistFixtures

  @create_attrs %{cabid: "some cabid", description: "some description", name: "some name"}
  @update_attrs %{cabid: "some updated cabid", description: "some updated description", name: "some updated name"}
  @invalid_attrs %{cabid: nil, description: nil, name: nil}

  describe "index" do
    test "lists all cabs", %{conn: conn} do
      conn = get(conn, Routes.cab_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Cabs"
    end
  end

  describe "new cab" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.cab_path(conn, :new))
      assert html_response(conn, 200) =~ "New Cab"
    end
  end

  describe "create cab" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.cab_path(conn, :create), cab: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.cab_path(conn, :show, id)

      conn = get(conn, Routes.cab_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Cab"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.cab_path(conn, :create), cab: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Cab"
    end
  end

  describe "edit cab" do
    setup [:create_cab]

    test "renders form for editing chosen cab", %{conn: conn, cab: cab} do
      conn = get(conn, Routes.cab_path(conn, :edit, cab))
      assert html_response(conn, 200) =~ "Edit Cab"
    end
  end

  describe "update cab" do
    setup [:create_cab]

    test "redirects when data is valid", %{conn: conn, cab: cab} do
      conn = put(conn, Routes.cab_path(conn, :update, cab), cab: @update_attrs)
      assert redirected_to(conn) == Routes.cab_path(conn, :show, cab)

      conn = get(conn, Routes.cab_path(conn, :show, cab))
      assert html_response(conn, 200) =~ "some updated cabid"
    end

    test "renders errors when data is invalid", %{conn: conn, cab: cab} do
      conn = put(conn, Routes.cab_path(conn, :update, cab), cab: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Cab"
    end
  end

  describe "delete cab" do
    setup [:create_cab]

    test "deletes chosen cab", %{conn: conn, cab: cab} do
      conn = delete(conn, Routes.cab_path(conn, :delete, cab))
      assert redirected_to(conn) == Routes.cab_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.cab_path(conn, :show, cab))
      end
    end
  end

  defp create_cab(_) do
    cab = cab_fixture()
    %{cab: cab}
  end
end
