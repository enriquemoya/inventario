defmodule Inventario.Zones do
  @moduledoc """
  The Zones context.
  """

  import Ecto.Query, warn: false
  alias Inventario.Repo

  alias Inventario.Zones.Types

  @doc """
  Returns the list of types.

  ## Examples

      iex> list_types()
      [%Types{}, ...]

  """
  def list_types do
    Repo.all(Types)
  end

  @doc """
  Gets a single types.

  Raises `Ecto.NoResultsError` if the Types does not exist.

  ## Examples

      iex> get_types!(123)
      %Types{}

      iex> get_types!(456)
      ** (Ecto.NoResultsError)

  """
  def get_types!(id), do: Repo.get!(Types, id)

  @doc """
  Creates a types.

  ## Examples

      iex> create_types(%{field: value})
      {:ok, %Types{}}

      iex> create_types(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_types(attrs \\ %{}) do
    %Types{}
    |> Types.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a types.

  ## Examples

      iex> update_types(types, %{field: new_value})
      {:ok, %Types{}}

      iex> update_types(types, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_types(%Types{} = types, attrs) do
    types
    |> Types.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Types.

  ## Examples

      iex> delete_types(types)
      {:ok, %Types{}}

      iex> delete_types(types)
      {:error, %Ecto.Changeset{}}

  """
  def delete_types(%Types{} = types) do
    Repo.delete(types)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking types changes.

  ## Examples

      iex> change_types(types)
      %Ecto.Changeset{source: %Types{}}

  """
  def change_types(%Types{} = types) do
    Types.changeset(types, %{})
  end

  alias Inventario.Zones.Zone

  @doc """
  Returns the list of zones.

  ## Examples

      iex> list_zones()
      [%Zone{}, ...]

  """
  def list_zones do
    Repo.all(Zone)
  end

  @doc """
  Gets a single zone.

  Raises `Ecto.NoResultsError` if the Zone does not exist.

  ## Examples

      iex> get_zone!(123)
      %Zone{}

      iex> get_zone!(456)
      ** (Ecto.NoResultsError)

  """
  def get_zone!(id), do: Repo.get!(Zone, id)

  @doc """
  Creates a zone.

  ## Examples

      iex> create_zone(%{field: value})
      {:ok, %Zone{}}

      iex> create_zone(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_zone(attrs \\ %{}) do
    %Zone{}
    |> Zone.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a zone.

  ## Examples

      iex> update_zone(zone, %{field: new_value})
      {:ok, %Zone{}}

      iex> update_zone(zone, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_zone(%Zone{} = zone, attrs) do
    zone
    |> Zone.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Zone.

  ## Examples

      iex> delete_zone(zone)
      {:ok, %Zone{}}

      iex> delete_zone(zone)
      {:error, %Ecto.Changeset{}}

  """
  def delete_zone(%Zone{} = zone) do
    Repo.delete(zone)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking zone changes.

  ## Examples

      iex> change_zone(zone)
      %Ecto.Changeset{source: %Zone{}}

  """
  def change_zone(%Zone{} = zone) do
    Zone.changeset(zone, %{})
  end
end
