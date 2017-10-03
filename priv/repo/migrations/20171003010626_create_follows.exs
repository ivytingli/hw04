defmodule Microblog.Repo.Migrations.CreateFollows do
  use Ecto.Migration

  def change do
    create table(:follows) do
      add: followed_user, references(:user, on_delete: :delete_all)
      add: following_user, references(:user, on_delete: :delete_all) 
    timstamps()
  end
end
