defmodule Storel.OrderProducts.OrderProduct do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "order_products" do
    field :price, :decimal
    field :quantity, :integer
    belongs_to :product, Storel.Products.Product
    belongs_to :order, Storel.Orders.Order

    timestamps()
  end

  @doc false
  def changeset(order_product, attrs) do
    order_product
    |> cast(attrs, [:price, :quantity, :product_id])
    |> validate_required([:price, :quantity, :product_id])
  end
end
