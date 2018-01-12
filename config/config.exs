# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :inventario,
  ecto_repos: [Inventario.Repo]

# Configures the endpoint
config :inventario, InventarioWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "wuAz1+5Y9DnYdQmKeBFiOCa0x5E+z+ppwPVIcw8owIQ5i14+VvB1DYWya9qMkJe5",
  render_errors: [view: InventarioWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Inventario.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

  config :guardian, Guardian,
  allowed_algos: ["HS256"],
  verify_module: Guardian.JWT,
  issuer: "Inventario",
  ttl: { 30, :days },
  allowed_drift: 2000,
  verify_issuer: true, # optional
  secret_key: "iHTeAMNwLKAspYdSM8doqBJ+Zm774ZqlkYdpyQsCs2pFY7W5CvDLR9ipoxyfQowA",
  serializer: Inventario.GuardianSerializer

config :argon2_elixir,
       t_cost: 2,
       m_cost: 12
config :bcrypt_elixir, :log_rounds, 4
config :pbkdf2_elixir, :rounds, 1


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
