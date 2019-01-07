defmodule MarusyaWeb.PageController do
  use MarusyaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def secret_temp(conn, _) do
    user = Guardian.Plug.current_resource(conn)
    render(conn, "secret_temp.html", current_user: user)
  end
end
