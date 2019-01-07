defmodule Marusya.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :nickname, :string
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:nickname, :password])
    |> validate_required([:nickname, :password])
    |> unique_constraint(:nickname)
  end
end
