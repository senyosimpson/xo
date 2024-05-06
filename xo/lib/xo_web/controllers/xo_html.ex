defmodule XoWeb.XoHTML do
  use XoWeb, :html

  def home(assigns) do
    updates = [
      "built a new form that i'm happy about",
      "took fks to the next level",
      "added support for gpus in fks",
      "did some good work today, tired of working all the time though",
      "new update"
    ]

    ~H"""
    <div>
      <ul>
        <li class="border-solid border-black border-4 p-4 m-4" :for={update <- updates}>
          <%= update %>
        </li>
      </ul>
    </div>
    """
  end
end
