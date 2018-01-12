defmodule InventarioWeb.Router do
  use InventarioWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader, realm: "Bearer"
    plug Guardian.Plug.LoadResource
  end
  pipeline :api_auth do
    #plug CORSPlug, [origin: "http://cd88f6e3.ngrok.io"]
    plug(Guardian.Plug.EnsureAuthenticated, %{"typ" => "token", handler: InventarioWeb.HttpErrorHandler})
  end

  pipeline :auth do
    #plug CORSPlug, [origin: "http://cd88f6e3.ngrok.io"]
    plug :accepts, ["json", "multipart"]
    plug Guardian.Plug.VerifyHeader, realm: "Token"
    plug Guardian.Plug.LoadResource
  end

  scope "/auth", InventarioWeb do
    pipe_through :auth
    post "/register", UserController, :register
    post "/login", UserController, :login
  end

  scope "/api", InventarioWeb do
    pipe_through([:api, :api_auth])
    resources "/users", UserController, except: [:new, :edit,:create]

  end
end
