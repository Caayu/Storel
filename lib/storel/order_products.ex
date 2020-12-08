defmodule Storel.OrderProducts do
  @moduledoc """
  The OrderProducts context.
  """

  import Ecto.Query, warn: false
  alias Storel.Repo

  alias Storel.OrderProducts.OrderProduct

  @doc """
  Returns the list of order_products.

  ## Examples

      iex> list_order_products()
      [%OrderProduct{}, ...]

  """
  def list_order_products do
    Repo.all(OrderProduct)
  end

  @doc """
  Gets a single order_product.

  Raises `Ecto.NoResultsError` if the Order product does not exist.

  ## Examples

      iex> get_order_product!(123)
      %OrderProduct{}

      iex> get_order_product!(456)
      ** (Ecto.NoResultsError)

  """
  def get_order_product!(id), do: Repo.get!(OrderProduct, id)

  @doc """
  Creates a order_product.

  ## Examples

      iex> create_order_product(%{field: value})
      {:ok, %OrderProduct{}}

      iex> create_order_product(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_order_product(attrs \\ %{}) do
    %OrderProduct{}
    |> OrderProduct.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a order_product.

  ## Examples

      iex> update_order_product(order_product, %{field: new_value})
      {:ok, %OrderProduct{}}

      iex> update_order_product(order_product, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_order_product(%OrderProduct{} = order_product, attrs) do
    order_product
    |> OrderProduct.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a order_product.

  ## Examples

      iex> delete_order_product(order_product)
      {:ok, %OrderProduct{}}

      iex> delete_order_product(order_product)
      {:error, %Ecto.Changeset{}}

  """
  def delete_order_product(%OrderProduct{} = order_product) do
    Repo.delete(order_product)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking order_product changes.

  ## Examples

      iex> change_order_product(order_product)
      %Ecto.Changeset{data: %OrderProduct{}}

  """
  def change_order_product(%OrderProduct{} = order_product, attrs \\ %{}) do
    OrderProduct.changeset(order_product, attrs)
  end
end
