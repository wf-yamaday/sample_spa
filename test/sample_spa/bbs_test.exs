defmodule SampleSpa.BbsTest do
  use SampleSpa.DataCase

  alias SampleSpa.Bbs

  describe "boards" do
    alias SampleSpa.Bbs.Board

    @valid_attrs %{description: "some description", title: "some title"}
    @update_attrs %{description: "some updated description", title: "some updated title"}
    @invalid_attrs %{description: nil, title: nil}

    def board_fixture(attrs \\ %{}) do
      {:ok, board} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Bbs.create_board()

      board
    end

    test "list_boards/0 returns all boards" do
      board = board_fixture()
      assert Bbs.list_boards() == [board]
    end

    test "get_board!/1 returns the board with given id" do
      board = board_fixture()
      assert Bbs.get_board!(board.id) == board
    end

    test "create_board/1 with valid data creates a board" do
      assert {:ok, %Board{} = board} = Bbs.create_board(@valid_attrs)
      assert board.description == "some description"
      assert board.title == "some title"
    end

    test "create_board/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bbs.create_board(@invalid_attrs)
    end

    test "update_board/2 with valid data updates the board" do
      board = board_fixture()
      assert {:ok, %Board{} = board} = Bbs.update_board(board, @update_attrs)
      assert board.description == "some updated description"
      assert board.title == "some updated title"
    end

    test "update_board/2 with invalid data returns error changeset" do
      board = board_fixture()
      assert {:error, %Ecto.Changeset{}} = Bbs.update_board(board, @invalid_attrs)
      assert board == Bbs.get_board!(board.id)
    end

    test "delete_board/1 deletes the board" do
      board = board_fixture()
      assert {:ok, %Board{}} = Bbs.delete_board(board)
      assert_raise Ecto.NoResultsError, fn -> Bbs.get_board!(board.id) end
    end

    test "change_board/1 returns a board changeset" do
      board = board_fixture()
      assert %Ecto.Changeset{} = Bbs.change_board(board)
    end
  end
end
