defmodule SampleSpaWeb.BoardController do
  use SampleSpaWeb, :controller

  alias SampleSpa.Bbs
  alias SampleSpa.Bbs.Board
  # postを追加
  alias SampleSpa.Bbs.Post

  action_fallback SampleSpaWeb.FallbackController

  def index(conn, _params) do
    boards = Bbs.list_boards()
    render(conn, "index.json", boards: boards)
  end

  def create(conn, %{"board" => board_params}) do
    with {:ok, %Board{} = board} <- Bbs.create_board(board_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.board_path(conn, :show, board))
      |> render("show.json", board: board)
    end
  end

  # 掲示板の投稿を全件取得
  def show(conn, %{"id" => board_id}) do
    posts = Bbs.get_posts_by_board_id!(board_id)
    conn
    |> put_view(SampleSpaWeb.PostView)
    |> render("index.json", posts: posts)
  end

  # 掲示板に投稿する
  def create_post(conn, %{"id" => board_id, "post" => post_params}) do
    with {:ok, %Post{} = post} <- Bbs.create_post(board_id, post_params) do
      conn
      |> put_status(:created)
      |> put_view(SampleSpaWeb.PostView)
      |> render("show.json", post: post)
    end
  end

  def update(conn, %{"id" => id, "board" => board_params}) do
    board = Bbs.get_board!(id)

    with {:ok, %Board{} = board} <- Bbs.update_board(board, board_params) do
      render(conn, "show.json", board: board)
    end
  end

  def delete(conn, %{"id" => id}) do
    board = Bbs.get_board!(id)

    with {:ok, %Board{}} <- Bbs.delete_board(board) do
      send_resp(conn, :no_content, "")
    end
  end
end
