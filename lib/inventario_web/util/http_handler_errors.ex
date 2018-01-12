defmodule InventarioWeb.HttpErrorHandler do
    import Plug.Conn
  
    def auth_error(conn, {type, reason}, _opts) do
      body = Poison.encode!(%{message: to_string(type)})
      send_resp(conn, 401, body)
    end
  
    def unauthenticated(conn, any) do
      body = Poison.encode!(%{message: to_string("not authorized")})
      send_resp(conn, 401, body)
    end
  end