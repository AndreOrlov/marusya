defmodule Marusya.Repo.Migrations.CreateExercises do
  use Ecto.Migration

  def change do
    create table(:exercises) do
      add :description, :string
      add :done, :boolean
      add :user_id, references(:users)

      timestamps()
    end

  end
end
