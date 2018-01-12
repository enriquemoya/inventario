defmodule InventarioWeb.UserController do
  use InventarioWeb, :controller

  alias Inventario.Accounts
  alias Inventario.Accounts.User
  alias Inventario.Accounts.Auth
  

  action_fallback InventarioWeb.FallbackController

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, "index.json", users: users)
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{} = user} <- Accounts.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    with {:ok, %User{}} <- Accounts.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end

  def register(conn, %{"email" => email, "password" => password}) do
    try do

      case Auth.register(%{email: email, password: password}) do
        {:ok, user} ->
          {:ok, jwt, _full_claims} = user |> Guardian.encode_and_sign(:token)
          conn
          |> put_status(:created)
          |> render(InventarioWeb.UserView, "login.json", jwt: jwt, user: user)

        {:error, message} ->
          conn
          |> put_status(:unauthorized)
          |> render(InventarioWeb, "error.json", message: message)
        _ ->
             conn
             |> put_status(:unauthorized)
             |> render(InventarioWeb.UserView, "error.json", message: "Error to save user")
      end
    rescue
       e in _ ->
         conn
         |> put_status(:unauthorized)
         |> render(InventarioWeb.UserView, "error.json", message: e)

    end
  end

  def login(conn, %{"email" => email, "password" => password}) do
    case Auth.find_user_and_check_password(email,password) do
      {:ok, user} ->
        {:ok, jwt, _full_claims} = user |> Guardian.encode_and_sign(:token)

        conn
        |> put_status(:created)
        |> render(InventarioWeb.UserView, "login.json", jwt: jwt, user: user)
      {:error, message} ->
        conn
        |> put_status(:unauthorized)
        |> render(InventarioWeb.UserView, "error.json", message: message)
    end
  end

  def unauthenticated(conn, _params) do
    conn
    |> put_status(:unauthorized)
    |> render(InventarioWeb.UserView, "error.json", message: "Not Authenticated")
  end

end
