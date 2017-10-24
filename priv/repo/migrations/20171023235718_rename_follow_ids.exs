defmodule Microblog.Repo.Migrations.RenameFollowIds do
  use Ecto.Migration

  def change do
  	alter table(:follows) do
  		remove :follower
  		remove :followed_user
  	end

  	alter table(:follows) do
  		add :followed_user_id, references(:users)
  		add :follower_id, references(:users)
  	end
  end
end
