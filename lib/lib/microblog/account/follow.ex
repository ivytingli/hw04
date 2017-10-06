defmodule Microblog.Account.Follow do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Account.Follow


  schema "follows" do
    field :followed_user, :id
    field :follower, :id

    timestamps()
  end

  @doc false
  def changeset(%Follow{} = follow, attrs) do
    follow
    |> cast(attrs, [:followed_user, :follower])
    |> validate_required([:followed_user, :follower])
  end
end
