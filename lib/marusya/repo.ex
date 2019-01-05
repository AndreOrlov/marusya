defmodule Marusya.Repo do
  use Ecto.Repo,
    otp_app: :marusya,
    adapter: Ecto.Adapters.Postgres
end
