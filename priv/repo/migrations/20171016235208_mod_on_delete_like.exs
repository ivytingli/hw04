defmodule Microblog.Repo.Migrations.ModOnDeleteLike do
  use Ecto.Migration

  def up do
    execute "ALTER TABLE likes DROP CONSTRAINT likes_user_id_fkey"
    execute "ALTER TABLE likes DROP CONSTRAINT likes_post_id_fkey"
    alter table(:likes) do
      modify :post_id, references(:posts, on_delete: :delete_all, null: false)
      modify :user_id, references(:users, on_delete: :delete_all, null: false)
    end
  end

  def down do
    execute "ALTER TABLE likes DROP CONSTRAINT likes_user_id_fkey"
    execute "ALTER TABLE likes DROP CONSTRAINT likes_post_id_fkey"
    alter table(:likes) do
      modify :user_id, references(:users, on_delete: :nothing, null: false)
      modify :post_id, references(:posts, on_delete: :nothing, null: false)
    end
  end
end

