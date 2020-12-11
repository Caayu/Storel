defmodule Storel.Customers.Customer do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "customers" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :password_hash, :string
    field :role, :string, default: "user"

    timestamps()
  end

  @required_fields [:email, :first_name, :last_name, :password, :password_confirmation, :role]

  @doc false
  def changeset(customer, attrs) do
    customer
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
    |> unique_constraint(:email, message: "Existe um usuario com esse e-mail")
    |> update_change(:email, &String.downcase/1)
    |> validate_format(:email, ~r/@/, message: "Digite um e-mail valido")
    |> validate_length(:password, min: 6, max: 100, message: "A senha deve ter entre 6 a 100 caracteres")
    |> validate_confirmation(:password, message: "A senha não é igual")
    |> hashing
  end

  defp hashing(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Argon2.add_hash(password))
  end

  defp hashing(changeset), do: changeset
end
