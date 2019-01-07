defmodule Marusya.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :nickname, :string
      add :password, :string

      timestamps()
    end

    create unique_index(:users, [:nickname])
  end
end
