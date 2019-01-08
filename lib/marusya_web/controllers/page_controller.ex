defmodule MarusyaWeb.PageController do
  use MarusyaWeb, :controller

  # Add param current_user to controller action
  def action(conn, _) do
    apply(__MODULE__, action_name(conn),
      [conn, conn.params, conn.assigns.current_user])
  end

  def index(conn, _params, _current_user) do
    render(conn, "index.html")
  end

  def secret_temp(conn, _params, _current_user) do
    render(conn, "secret_temp.html")
  end
end
