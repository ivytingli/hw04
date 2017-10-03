defmodule Microblog.Repo.Migrations.RenameFields do
  use Ecto.Migration

  def change do
    modify table(:follows) do
      remove :followed-user
      add :followed_user, references(:users, on_delete: :delete_all)
    end
  end
end
