defmodule Chemical.Element do
  use Ecto.Schema
  import Ecto.Changeset

  schema "elements" do
    field :type, :integer
    field :dx, :float
    field :dy, :float
    field :x, :float
    field :y, :float

    timestamps()
  end

  def spawn() do
    %Chemical.Element{
      type: :rand.uniform(4),
      dx: (:rand.uniform(100) - 50) / 100,
      dy: (:rand.uniform(100) - 50) / 100,
      x: :rand.uniform(100) / 1.0,
      y: :rand.uniform(100) / 1.0
    }
  end

  def display(element) do
    Code.eval_string("""
    [
      '💧', '🌍', '🔥', '🌬',
      '🌱', '☁', '🌊',
      '🔩', '🌪',
      '🌫'
    ]
    """)
    |> elem(0)
    |> Enum.at(element.type)
  end

  @doc false
  def changeset(element, attrs) do
    element
    |> cast(attrs, [:x, :y, :dx, :dy])
    |> validate_required([:x, :y, :dx, :dy])
  end
end
