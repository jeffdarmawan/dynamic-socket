defmodule DynamicSocket.Repo do
  use Ecto.Repo,
    otp_app: :dynamic_socket,
    adapter: Ecto.Adapters.Postgres
end
