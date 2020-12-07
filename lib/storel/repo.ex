defmodule Storel.Repo do
  use Ecto.Repo,
    otp_app: :storel,
    adapter: Ecto.Adapters.Postgres
end
