defmodule XoWeb.XoController do
  use XoWeb, :controller
  import Ecto.Query, only: [from: 2]

 def home(conn, _) do
    render(
      conn,
      :home,
      page_title: "Xo • Home",
      posts: Xo.Repo.all(from p in Xo.Post, where: p.user_id == 2, select: p.text)
    )
  end
end
