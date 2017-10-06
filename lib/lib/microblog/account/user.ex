defmodule Microblog.Account.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Account.User


  schema "users" do
    has_many :posts, Microblog.Blog.Post
    has_many :follows, Microblog.Account.Follow
    field :bio, :string
    field :email, :string
    field :handle, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do

    user
    |> cast(attrs, [:name, :handle, :email, :bio])
    |> cast_assoc(:follows)
    |> validate_required([:name, :handle, :email])
  end
end
