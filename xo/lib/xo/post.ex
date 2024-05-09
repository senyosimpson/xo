defmodule Xo.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :tags, {:array, :string}
    field :text, :string
    field :user_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:text, :tags])
    |> validate_required([:text, :user_id])
  end
end
