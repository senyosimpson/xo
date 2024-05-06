defmodule XoWeb.XoHTML do
  use XoWeb, :html

  def home(assigns) do
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
end

