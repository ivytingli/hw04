defmodule Microblog.Repo.Migrations.CreateFollows do
  use Ecto.Migration

  def change do
    create table(:follows) do
      add :followed_user, references(:users, on_delete: :delete_all)
      add :follower, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:follows, [:followed_user])
    create index(:follows, [:follower])
  end
end
