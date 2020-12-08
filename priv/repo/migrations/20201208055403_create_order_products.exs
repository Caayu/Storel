defmodule Storel.Repo.Migrations.CreateOrderProducts do
  use Ecto.Migration

  def change do
    create table(:order_products, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :price, :decimal
      add :quantity, :integer
      add :product_id, references(:products, on_delete: :nilify_all, on_update: :nilify_all, type: :binary_id)

      timestamps()
    end

    create index(:order_products, [:product_id])
  end
end
