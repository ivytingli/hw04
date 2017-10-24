defmodule Microblog.Account.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Account.User


  schema "users" do
    has_many :posts, Microblog.Blog.Post
    has_many :followed_user, Microblog.Account.Follow, foreign_key: :follows
    has_many :follower, Microblog.Account.Follow, foreign_key: :follows
    field :bio, :string
    field :email, :string
    field :handle, :string
    field :name, :string
    field :password_hash, :string
    field :pw_tries, :integer, null: false, default: 0
    field :pw_last_try, :utc_datetime
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :handle, :email, :bio, :password, :password_confirmation])
    |> validate_password(:password)
    |> put_pass_hash()
    |> validate_required([:name, :handle, :email, :password_hash])
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Comeonin.Argon2.add_hash(password))
  end

  defp put_pass_hash(changeset) do
    changeset
  end

  defp valid_password?(password) when byte_size(password) > 7 do
    {:ok, password}
  end
  defp valid_password?(_), do: {:error, "The password is too short"}

  def validate_password(changeset, field, options \\ []) do
    validate_change(changeset, field, fn _, password ->
      case valid_password?(password) do
        {:ok, _} -> []
        {:error, msg} -> [{field, options[:message] || msg}]
      end
    end)
  end

end