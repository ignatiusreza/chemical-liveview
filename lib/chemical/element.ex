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

  def spawn(x, y) do
    %Chemical.Element{
      type: :rand.uniform(4),
      dx: (:rand.uniform(100) - 50) / 100,
      dy: (:rand.uniform(100) - 50) / 100,
      x: x,
      y: y
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

  def tick(element) do
    {x, dx} = update(element.x, element.dx)
    {y, dy} = update(element.y, element.dy)

    element |> changeset(%{x: x, dx: dx, y: y, dy: dy})
  end

  def update(a, da) do
    (fn
       a when a < 0 -> {-a, -da}
       a when a > 100 -> {100 - (a - 100), -da}
       a -> {a, da}
     end).(a + da)
  end

  @doc false
  def changeset(element, attrs) do
    element
    |> cast(attrs, [:x, :y, :dx, :dy])
    |> validate_required([:x, :y, :dx, :dy])
  end
end
