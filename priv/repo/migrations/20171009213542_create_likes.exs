defmodule Microblog.Repo.Migrations.CreateLikes do
  use Ecto.Migration

  def change do
    create table(:likes) do
      add :post_id, references(:posts, on_delete: :nothing, null: false)
      add :user_id, references(:users, on_delete: :nothing, null: false)

      timestamps()
    end

    create index(:likes, [:post_id])
    create index(:likes, [:user_id])
  end
end
