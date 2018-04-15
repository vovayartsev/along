# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :along, ecto_repos: [Along.Repo]

# Configures the endpoint
config :along, AlongWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "UvGHBpzQJdeNiizbluW/XD+JazXbgFoXpn531/Gqgb4WzK9c/SbpoyXWk1OCN2Ui",
  render_errors: [view: AlongWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Along.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

config :along, Along.Adapters.Travis, token: System.get_env("TRAVIS_CI_TOKEN")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
