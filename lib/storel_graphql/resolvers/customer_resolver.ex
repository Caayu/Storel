defmodule StorelGraphql.Resolvers.CustomerResolver do
  alias Storel.Customers

  def list_customers(_parent, _args, _resolution) do
    {:ok, Customers.list_customers()}
  end
end
