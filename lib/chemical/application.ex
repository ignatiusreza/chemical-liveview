defmodule Chemical.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Chemical.Repo,
      # Start the Telemetry supervisor
      ChemicalWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Chemical.PubSub},
      # Start the Endpoint (http/https)
      ChemicalWeb.Endpoint,
      # Start a worker by calling: Chemical.Worker.start_link(arg)
      # {Chemical.Worker, arg}
      Chemical.Scheduler
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Chemical.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ChemicalWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
