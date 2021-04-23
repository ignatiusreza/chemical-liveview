defmodule Chemical.Repo do
  use Ecto.Repo,
    otp_app: :chemical,
    adapter: Ecto.Adapters.Postgres
end
