defmodule StorelGraphql.Schema do
  use Absinthe.Schema
  alias StorelGraphql.Schema
  alias StorelGraphql.Resolvers

  import_types(Schema.Types)

  query do
    @desc "Get all Customers"
    field :customers, list_of(:customer_type) do
      resolve(&Resolvers.CustomerResolver.list_customers/3)
    end

    @desc "Get all Products"
    field :products, list_of(:product_type) do
      resolve(&Resolvers.ProductResolver.list_products/3)
    end
  end

  # mutation do

  # end
end
