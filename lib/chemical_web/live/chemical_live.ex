defmodule ChemicalWeb.ChemicalLive do
  use ChemicalWeb, :live_view
  alias Chemical.Element
  alias Chemical.Repo

  @impl true
  def mount(_params, _session, socket) do
    chemicals = Element |> Repo.all()

    {:ok, assign(socket, query: "", chemicals: chemicals)}
  end
end
