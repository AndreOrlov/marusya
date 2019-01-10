defmodule Marusya.Todos.Exercise do
  use Ecto.Schema
  import Ecto.Changeset

  schema "exercises" do
    field :description, :string
    field :done, :boolean

    belongs_to :user, Marusya.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(exercise, attrs) do
    exercise
    |> cast(attrs, [])
    |> validate_required([])
  end
end
