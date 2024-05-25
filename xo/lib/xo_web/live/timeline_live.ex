defmodule XoWeb.TimelineLive do
  use XoWeb, :live_view
  import Ecto.Query, only: [from: 2]

  def render(assigns) do
    ~H"""
    <div>
      <ul>
        <li class="border-solid border-black border-4 p-4 m-4" :for={p <- @posts}>
          <%= p %>
        </li>
      </ul>
    </div>
    """
  end

  def mount(_, _, socket) do
    posts =
      Xo.Repo.all(
        from(p in Xo.Post, where: p.user_id == 1, select: p.text, order_by: [desc: p.updated_at])
      )

    socket = assign(socket, page_title: "Xo • Home", posts: posts)

    {:ok, socket}
  end
end
