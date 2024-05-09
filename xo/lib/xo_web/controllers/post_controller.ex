defmodule XoWeb.PostController do
  use XoWeb, :controller

 def post(conn, %{"user_id" => uid, "message" => msg}) do
   Xo.Repo.insert(%Xo.Post{user_id: uid, text: msg})
   render(conn, :post)
  end
end
