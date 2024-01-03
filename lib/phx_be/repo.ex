defmodule PhxBe.Repo do
  use Ecto.Repo,
    otp_app: :phx_be,
    adapter: Ecto.Adapters.Postgres
end
