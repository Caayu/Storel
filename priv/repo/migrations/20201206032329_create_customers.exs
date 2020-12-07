defmodule Storel.Repo.Migrations.CreateCustomers do
  use Ecto.Migration

  def change do
    create table(:customers, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :email, :string
      add :first_name, :string
      add :last_name, :string
      add :password_hash, :string
      add :role, :string

      timestamps()
    end

    create(unique_index(:customers, [:email]))
  end
end
