defmodule Inventario.ProductsTest do
  use Inventario.DataCase

  alias Inventario.Products

  describe "products" do
    alias Inventario.Products.Product

    @valid_attrs %{code: "some code", description: "some description", name: "some name"}
    @update_attrs %{code: "some updated code", description: "some updated description", name: "some updated name"}
    @invalid_attrs %{code: nil, description: nil, name: nil}

    def product_fixture(attrs \\ %{}) do
      {:ok, product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Products.create_product()

      product
    end

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Products.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Products.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      assert {:ok, %Product{} = product} = Products.create_product(@valid_attrs)
      assert product.code == "some code"
      assert product.description == "some description"
      assert product.name == "some name"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      assert {:ok, product} = Products.update_product(product, @update_attrs)
      assert %Product{} = product
      assert product.code == "some updated code"
      assert product.description == "some updated description"
      assert product.name == "some updated name"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Products.update_product(product, @invalid_attrs)
      assert product == Products.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Products.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Products.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Products.change_product(product)
    end
  end

  describe "packages" do
    alias Inventario.Products.Package

    @valid_attrs %{height: 120.5, length: 120.5, prefer: true, stowage: 42, weight: 120.5, width: 120.5}
    @update_attrs %{height: 456.7, length: 456.7, prefer: false, stowage: 43, weight: 456.7, width: 456.7}
    @invalid_attrs %{height: nil, length: nil, prefer: nil, stowage: nil, weight: nil, width: nil}

    def package_fixture(attrs \\ %{}) do
      {:ok, package} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Products.create_package()

      package
    end

    test "list_packages/0 returns all packages" do
      package = package_fixture()
      assert Products.list_packages() == [package]
    end

    test "get_package!/1 returns the package with given id" do
      package = package_fixture()
      assert Products.get_package!(package.id) == package
    end

    test "create_package/1 with valid data creates a package" do
      assert {:ok, %Package{} = package} = Products.create_package(@valid_attrs)
      assert package.height == 120.5
      assert package.length == 120.5
      assert package.prefer == true
      assert package.stowage == 42
      assert package.weight == 120.5
      assert package.width == 120.5
    end

    test "create_package/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Products.create_package(@invalid_attrs)
    end

    test "update_package/2 with valid data updates the package" do
      package = package_fixture()
      assert {:ok, package} = Products.update_package(package, @update_attrs)
      assert %Package{} = package
      assert package.height == 456.7
      assert package.length == 456.7
      assert package.prefer == false
      assert package.stowage == 43
      assert package.weight == 456.7
      assert package.width == 456.7
    end

    test "update_package/2 with invalid data returns error changeset" do
      package = package_fixture()
      assert {:error, %Ecto.Changeset{}} = Products.update_package(package, @invalid_attrs)
      assert package == Products.get_package!(package.id)
    end

    test "delete_package/1 deletes the package" do
      package = package_fixture()
      assert {:ok, %Package{}} = Products.delete_package(package)
      assert_raise Ecto.NoResultsError, fn -> Products.get_package!(package.id) end
    end

    test "change_package/1 returns a package changeset" do
      package = package_fixture()
      assert %Ecto.Changeset{} = Products.change_package(package)
    end
  end
end
