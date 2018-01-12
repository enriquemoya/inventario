defmodule InventarioWeb.UserView do
  use InventarioWeb, :view
  alias InventarioWeb.{UserView,FormatHelpers}

  def render("index.json", %{users: users}) do
    %{users: render_many(users, UserView, "user.json"),
      usersCount: length(users)}
  end

  def render("show.json", %{jwt: jwt, user: user}) do
    %{user: Map.merge(render_one(user, UserView, "user.json"), %{token: jwt})}
  end

  def render("show.json", %{user: user}) do
    %{user: render_one(user, UserView, "user.json")}
  end

  def render("login.json", %{jwt: jwt, user: user}) do
    %{user: Map.merge(render_one(user, UserView, "user.json"), %{token: jwt})}
  end

  def render("error.json", %{message: message}) do
    %{message: message}
   end

  def render("user.json", %{user: user}) do
    user
    |> Map.from_struct
    |> Map.put(:inserted_at, NaiveDateTime.to_iso8601(user.inserted_at))
    |> Map.put(:updated_at, NaiveDateTime.to_iso8601(user.updated_at))
    |> Map.take([:id, :email, :token, :inserted_at, :updated_at])
    |> FormatHelpers.camelize
  end



end
