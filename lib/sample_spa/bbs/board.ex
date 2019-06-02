defmodule SampleSpa.Bbs.Board do
  use Ecto.Schema
  import Ecto.Changeset

  schema "boards" do
    field :description, :string
    field :title, :string

    # postとの関係
    has_many :posts, SampleSpa.Bbs.Post, on_delete: :delete_all

    timestamps()
  end

  @doc false
  def changeset(board, attrs) do
    board
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :description])
  end
end
