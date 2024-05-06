defmodule XoWeb.XoController do
  use XoWeb, :controller

  def home(conn, _) do
    render(conn, :home)
  end
end
