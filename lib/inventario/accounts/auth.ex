
defmodule Inventario.Accounts.Auth do
    @moduledoc """
    The boundry for the Auth system
    """
  
    import Ecto.{Query, Changeset}, warn: false
  
    alias Inventario.Repo
    alias Inventario.Accounts.User
  
    def find_user_and_check_password(email, password) do
      user = Repo.get_by(User, email: String.downcase(email))
  
      case check_password(user, password) do
        true -> {:ok, user}
        _ -> {:error, "Could not login"}
      end
    end
  
    def register(attrs \\ %{}) do
      case hash_password(attrs.password) do
        {:ok, password} ->
          user = %User{email: attrs.email, password: password}
          Repo.insert(user)
        {:error, message} ->
         {:error, message}
      end
    end
  
    defp check_password(user, password) do
      case user do
        nil -> false
        _ -> Comeonin.Argon2.checkpw(password, user.password)
      end
    end
  
    defp hash_password(password) do
      try do
        case Comeonin.Argon2.add_hash(password) do
          nil ->
            {:error, "not posible hash password"}
          %{password: pass, password_hash: hash} ->
            {:ok, hash}
        end
      rescue
         e in _ ->
           {:error, e}
       end
    end
  end