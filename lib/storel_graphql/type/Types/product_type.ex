defmodule StorelGraphql.Schema.Types.ProductType do
  use Absinthe.Schema.Notation

  object :product_type do
    field :name, :string
    field :price, :integer
    field :quantity, :integer
  end
end
