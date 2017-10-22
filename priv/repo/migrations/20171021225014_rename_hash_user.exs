defmodule Microblog.Repo.Migrations.RenameHashUser do
  use Ecto.Migration

  def change do
    rename table("users"), :password_has, to: :password_hash
  end
end
