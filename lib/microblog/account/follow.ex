defmodule Microblog.Account.Follow do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Account.Follow


  schema "follows" do
    #belongs_to :user, Microblog.Account.User
    belongs_to :followed_user, Microblog.Account.User, references: :user
    belongs_to :follower, Microblog.Account.User, references: :user

    timestamps()
  end

  @doc false
  def changeset(%Follow{} = follow, attrs) do
    follow
    |> cast(attrs, [:followed_user_id, :follower_id])
    #|> cast(attrs, [:follower])
    #|> cast_assoc(attrs, [:followed_user, :follower])
    |> validate_required([:followed_user_id, :follower_id])
    #|> cast(attrs, [:followed_user, :follower])
  end
end
