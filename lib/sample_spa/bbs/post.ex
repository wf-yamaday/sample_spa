defmodule SampleSpa.Bbs.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :body, :string

    # boardとの関係
    belongs_to :board, SampleSpa.Bbs.Board, foreign_key: :board_id

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:body])
    |> validate_required([:body])
  end
end
