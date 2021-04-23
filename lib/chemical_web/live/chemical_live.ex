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

  @impl true
  def handle_event(
        "spawn",
        %{"offsetWidth" => width, "offsetHeight" => height, "offsetX" => x, "offsetY" => y} =
          _event,
        socket
      ) do
    Element.spawn(x / width * 100, y / height * 100) |> Repo.insert!()

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
    Process.send_after(self(), :refresh, 16)

    socket
  end
end
