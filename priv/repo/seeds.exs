# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Storel.Repo.insert!(%Storel.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
customer = %{email: "teste4@mail.com", first_name: "teste", last_name: "teste", password: "123456", password_confirmation: "123456", role: "1234"}

customer
|> Storel.Customers.create_customer()

playstation = %{name: "Playstation 5", price: 3000, quantity: 300}
xbox = %{name: "Xbox Series X", price: 3500, quantity: 100}

playstation
|> Storel.Products.create_product()

xbox
|> Storel.Products.create_product()
