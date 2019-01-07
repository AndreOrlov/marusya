# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :marusya,
  ecto_repos: [Marusya.Repo]

# Configures the endpoint
config :marusya, MarusyaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "TdlTQN1OJqu4mX2ZEeAl7iwcB81zqcpf5EPBnApQ7yJ+O4ZBWJ3O7hLRG6wZT90I",
  render_errors: [view: MarusyaWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Marusya.PubSub, adapter: Phoenix.PubSub.PG2]

config :marusya, Marusya.Accounts.Guardian,
       issuer: "marusya",
       secret_key: "V5Tfzv52iNE6Fs7wKG+RmLp8bJPBqbujuDH1ms2CBZfUyWmnnoIMEsBTsZz4sTGb"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :phoenix, :template_engines,
  slim: PhoenixSlime.Engine,
  slime: PhoenixSlime.Engine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
