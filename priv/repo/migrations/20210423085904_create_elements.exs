defmodule Chemical.Repo.Migrations.CreateElements do
  use Ecto.Migration

  def change do
    create table(:elements) do
      add :type, :integer
      add :x, :float
      add :y, :float
      add :dx, :float
      add :dy, :float

      timestamps()
    end
  end
end
