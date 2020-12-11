defmodule StorelGraphql.Schema.Types.CustomerType do
  use Absinthe.Schema.Notation

  object :customer_type do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :role, :string
  end
end
