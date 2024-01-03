defmodule DynamicSocket.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      DynamicSocketWeb.Telemetry,
      DynamicSocket.Repo,
      {DNSCluster, query: Application.get_env(:dynamic_socket, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: DynamicSocket.PubSub},
      # Start a worker by calling: DynamicSocket.Worker.start_link(arg)
      # {DynamicSocket.Worker, arg},
      # Start to serve requests, typically the last entry
      DynamicSocketWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DynamicSocket.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DynamicSocketWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
