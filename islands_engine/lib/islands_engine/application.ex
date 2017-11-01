defmodule IslandsEngine.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # List all child processes to be supervised.
    # Starts a worker by calling: IslandsEngine.Worker.start_link(arg)
    # {IslandsEngine.Worker, arg},
    children = [
      {Registry, keys: :unique, name: Registry.Game},
      IslandsEngine.GameSupervisor
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    :ets.new(:game_state, [:public, :named_table])
    opts = [strategy: :one_for_one, name: IslandsEngine.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
