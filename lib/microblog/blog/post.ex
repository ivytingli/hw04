defmodule Microblog.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Blog.Post


  schema "posts" do
    belongs_to :user, Microblog.Account.User
    has_many :like, Microblog.Feedback.Like
    field :body, :string

    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do

    post
    |> cast(attrs, [:body, :user_id])
    |> validate_required([:body, :user_id])
  end
end
