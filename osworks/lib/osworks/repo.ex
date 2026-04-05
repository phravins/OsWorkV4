defmodule Osworks.Repo do
  use Ecto.Repo,
    otp_app: :osworks,
    adapter: Ecto.Adapters.Postgres
end
