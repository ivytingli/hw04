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
<<<<<<< HEAD
    |> cast(attrs, [:followed_user, :follower])
    |> validate_required([:followed_user, :follower])
=======
    |> cast(attrs, [:follower])
    |> cast_assoc(:user)
    |> validate_required([:user, :follower])
>>>>>>> 013a8dfb28fe5fa68811dbd757a9ce5bd5d8891d
  end
end
