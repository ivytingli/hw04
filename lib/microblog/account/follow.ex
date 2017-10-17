defmodule Microblog.Account.Follow do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Account.Follow


  schema "follows" do
    belongs_to :user, Microblog.Account.User
    #field :followed_user, :id
    field :follower, :id

    timestamps()
  end

  @doc false
  def changeset(%Follow{} = follow, attrs) do
    follow
    |> cast(attrs, [:follower])
    |> cast_assoc(:user)
    |> validate_required([:user, :follower])
  end
end
