defmodule Microblog.Feedback.Like do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Feedback.Like


  schema "likes" do
    belongs_to :post, Microblog.Blog.Post
    belongs_to :user, Microblog.Account.User

    timestamps()
  end

  @doc false
  def changeset(%Like{} = like, attrs) do
    like
    |> cast(attrs, [:post_id, :user_id])
    |> validate_required([:post_id, :user_id])
  end
end
