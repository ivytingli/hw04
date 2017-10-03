defmodule Microblog.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :handle, :string
      add :email, :string
      add :bio, :text

      timestamps()
    end

  end
end
