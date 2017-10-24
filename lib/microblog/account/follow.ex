defmodule Microblog.Account.Follow do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Account.Follow


  schema "follows" do
    belongs_to :followed_user, Microblog.Account.User, references: :user
    belongs_to :follower, Microblog.Account.User, references: :user

    timestamps()
  end

  @doc false
  def changeset(%Follow{} = follow, attrs) do
    follow
    |> cast(attrs, [:followed_user_id, :follower_id])
    |> validate_required([:followed_user_id, :follower_id])
  end
end
