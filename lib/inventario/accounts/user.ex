defmodule Inventario.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Inventario.Accounts.User


  schema "users" do
    field :email, :string
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> validate_length(:password, min: 8)
    |> validate_length(:password, max: 10)
  end
end
