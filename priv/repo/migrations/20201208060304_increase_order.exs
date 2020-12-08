defmodule Storel.Repo.Migrations.IncreaseOrder do
  use Ecto.Migration

  def change do
    alter table(:order_products, primary_key: false) do
      add :order_id, references(:orders, on_delete: :nilify_all, on_update: :nilify_all, type: :binary_id)
    end

    create index(:order_products, [:order_id])
  end
end
