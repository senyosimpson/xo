defmodule XoWeb.XoController do
  use XoWeb, :controller
  import Ecto.Query, only: [from: 2]

 def home(conn, _) do
    conn = assign(conn, :posts, Xo.Repo.all(from p in Xo.Post, where: p.user_id == 2, select: p.text))
    render(conn, :home)
  end
end
