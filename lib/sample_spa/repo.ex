defmodule SampleSpa.Repo do
  use Ecto.Repo,
    otp_app: :sample_spa,
    adapter: Ecto.Adapters.MySQL
end
