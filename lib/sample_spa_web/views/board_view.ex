defmodule SampleSpaWeb.BoardView do
  use SampleSpaWeb, :view
  alias SampleSpaWeb.BoardView

  def render("index.json", %{boards: boards}) do
    %{data: render_many(boards, BoardView, "board.json")}
  end

  def render("show.json", %{board: board}) do
    %{data: render_one(board, BoardView, "board.json")}
  end

  def render("board.json", %{board: board}) do
    %{id: board.id,
      title: board.title,
      description: board.description}
  end
end
