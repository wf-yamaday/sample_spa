defmodule SampleSpa.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :body, :string
      
      # board_idを追加する
      add :board_id, references(:boards, on_delete: :delete_all), null: false

      timestamps()
    end

  end
end
