# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :chemical,
  ecto_repos: [Chemical.Repo]

# Configures the endpoint
config :chemical, ChemicalWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PRkUiodbJwOxB0YkHfUFmSkPwNwsWdcGh36Mh+veCdzfneWQdI6mSh7buUjg0gQN",
  render_errors: [view: ChemicalWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Chemical.PubSub,
  live_view: [signing_salt: "/8XuE6Zv"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
