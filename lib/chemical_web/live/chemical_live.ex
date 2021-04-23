defmodule ChemicalWeb.ChemicalLive do
  use ChemicalWeb, :live_view
  alias Chemical.Element
  alias Chemical.Repo

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
     socket
     |> init_schedule_refresh()
     |> assign(chemicals: Element |> Repo.all())}
  end

  @impl true
  def handle_info(:refresh, socket) do
    {:noreply,
     socket
     |> assign(chemicals: Element |> Repo.all())
     |> schedule_refresh()}
  end

  defp init_schedule_refresh(socket) do
    if connected?(socket) do
      schedule_refresh(socket)
    else
      socket
    end
  end

  defp schedule_refresh(socket) do
    Process.send_after(self(), :refresh, 1)

    socket
  end
end
