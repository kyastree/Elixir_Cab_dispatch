defmodule TestApiWeb.CabController do
  use TestApiWeb, :controller

  alias TestApi.Cablist
  alias TestApi.Cablist.Cab

  def index(conn, _params) do
    cabs = Cablist.list_cabs()
    render(conn, "index.html", cabs: cabs)
  end

  def new(conn, _params) do
    changeset = Cablist.change_cab(%Cab{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"cab" => cab_params}) do
    case Cablist.create_cab(cab_params) do
      {:ok, cab} ->
        conn
        |> put_flash(:info, "Cab created successfully.")
        |> redirect(to: Routes.cab_path(conn, :show, cab))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    cab = Cablist.get_cab!(id)
    render(conn, "show.html", cab: cab)
  end

  def edit(conn, %{"id" => id}) do
    cab = Cablist.get_cab!(id)
    changeset = Cablist.change_cab(cab)
    render(conn, "edit.html", cab: cab, changeset: changeset)
  end

  def update(conn, %{"id" => id, "cab" => cab_params}) do
    cab = Cablist.get_cab!(id)

    case Cablist.update_cab(cab, cab_params) do
      {:ok, cab} ->
        conn
        |> put_flash(:info, "Cab updated successfully.")
        |> redirect(to: Routes.cab_path(conn, :show, cab))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", cab: cab, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    cab = Cablist.get_cab!(id)
    {:ok, _cab} = Cablist.delete_cab(cab)

    conn
    |> put_flash(:info, "Cab deleted successfully.")
    |> redirect(to: Routes.cab_path(conn, :index))
  end
end
