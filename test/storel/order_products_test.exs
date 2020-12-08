defmodule Storel.OrderProductsTest do
  use Storel.DataCase

  alias Storel.OrderProducts

  describe "order_products" do
    alias Storel.OrderProducts.OrderProduct

    @valid_attrs %{price: "120.5", quantity: 42}
    @update_attrs %{price: "456.7", quantity: 43}
    @invalid_attrs %{price: nil, quantity: nil}

    def order_product_fixture(attrs \\ %{}) do
      {:ok, order_product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> OrderProducts.create_order_product()

      order_product
    end

    test "list_order_products/0 returns all order_products" do
      order_product = order_product_fixture()
      assert OrderProducts.list_order_products() == [order_product]
    end

    test "get_order_product!/1 returns the order_product with given id" do
      order_product = order_product_fixture()
      assert OrderProducts.get_order_product!(order_product.id) == order_product
    end

    test "create_order_product/1 with valid data creates a order_product" do
      assert {:ok, %OrderProduct{} = order_product} = OrderProducts.create_order_product(@valid_attrs)
      assert order_product.price == Decimal.new("120.5")
      assert order_product.quantity == 42
    end

    test "create_order_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = OrderProducts.create_order_product(@invalid_attrs)
    end

    test "update_order_product/2 with valid data updates the order_product" do
      order_product = order_product_fixture()
      assert {:ok, %OrderProduct{} = order_product} = OrderProducts.update_order_product(order_product, @update_attrs)
      assert order_product.price == Decimal.new("456.7")
      assert order_product.quantity == 43
    end

    test "update_order_product/2 with invalid data returns error changeset" do
      order_product = order_product_fixture()
      assert {:error, %Ecto.Changeset{}} = OrderProducts.update_order_product(order_product, @invalid_attrs)
      assert order_product == OrderProducts.get_order_product!(order_product.id)
    end

    test "delete_order_product/1 deletes the order_product" do
      order_product = order_product_fixture()
      assert {:ok, %OrderProduct{}} = OrderProducts.delete_order_product(order_product)
      assert_raise Ecto.NoResultsError, fn -> OrderProducts.get_order_product!(order_product.id) end
    end

    test "change_order_product/1 returns a order_product changeset" do
      order_product = order_product_fixture()
      assert %Ecto.Changeset{} = OrderProducts.change_order_product(order_product)
    end
  end
end
