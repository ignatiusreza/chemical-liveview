# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Chemical.Repo.insert!(%Chemical.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Chemical.Repo
alias Chemical.Element

Element.spawn() |> Repo.insert!()
Element.spawn() |> Repo.insert!()
Element.spawn() |> Repo.insert!()
Element.spawn() |> Repo.insert!()
