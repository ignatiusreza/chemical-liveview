defmodule Chemical.Scheduler do
  use GenServer
  alias Chemical.Element
  alias Chemical.Repo

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    schedule_work()

    {:ok, state}
  end

  def handle_info(:work, state) do
    Element
    |> Repo.all()
    |> Enum.each(fn element -> element |> Element.tick() |> Repo.update() end)

    schedule_work()

    {:noreply, state}
  end

  defp schedule_work() do
    Process.send_after(self(), :work, 16)
  end
end
