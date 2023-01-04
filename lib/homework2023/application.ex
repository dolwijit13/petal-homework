defmodule Homework2023.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Homework2023.Repo,
      # Start the Telemetry supervisor
      Homework2023Web.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Homework2023.PubSub},
      # Start the Endpoint (http/https)
      Homework2023Web.Endpoint
      # Start a worker by calling: Homework2023.Worker.start_link(arg)
      # {Homework2023.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Homework2023.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Homework2023Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
