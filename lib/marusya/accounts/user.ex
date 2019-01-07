defmodule Marusya.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Comeonin.Bcrypt

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
    |> put_password_hash()
  end

  defp put_password_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, password: Bcrypt.hashpwsalt(password))
  end

  defp put_password_hash(changeset), do: changeset
end
