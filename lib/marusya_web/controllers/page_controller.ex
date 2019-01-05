defmodule MarusyaWeb.PageController do
  use MarusyaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
