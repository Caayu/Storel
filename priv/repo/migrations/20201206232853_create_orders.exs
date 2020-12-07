defmodule Storel.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :customer_id, references(:customers, on_delete: :nilify_all, on_update: :nilify_all, type: :binary_id)
      add :product_id, references(:products, on_delete: :nilify_all, on_update: :nilify_all, type: :binary_id)

      timestamps()
    end

    create index(:orders, [:customer_id])
    create index(:orders, [:product_id])
  end
end
