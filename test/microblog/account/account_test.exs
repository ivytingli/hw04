defmodule Microblog.AccountTest do
  use Microblog.DataCase

  alias Microblog.Account

  describe "users" do
    alias Microblog.Account.User

    @valid_attrs %{bio: "some bio", email: "some email", handle: "some handle", name: "some name"}
    @update_attrs %{bio: "some updated bio", email: "some updated email", handle: "some updated handle", name: "some updated name"}
    @invalid_attrs %{bio: nil, email: nil, handle: nil, name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Account.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Account.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Account.create_user(@valid_attrs)
      assert user.bio == "some bio"
      assert user.email == "some email"
      assert user.handle == "some handle"
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Account.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.bio == "some updated bio"
      assert user.email == "some updated email"
      assert user.handle == "some updated handle"
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_user(user, @invalid_attrs)
      assert user == Account.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Account.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Account.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Account.change_user(user)
    end
  end

  describe "follows" do
    alias Microblog.Account.Follow

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def follow_fixture(attrs \\ %{}) do
      {:ok, follow} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_follow()

      follow
    end

    @tag :skip
    test "list_follows/0 returns all follows" do
      follow = follow_fixture()
      assert Account.list_follows() == [follow]
    end

    @tag :skip
    test "get_follow!/1 returns the follow with given id" do
      follow = follow_fixture()
      assert Account.get_follow!(follow.id) == follow
    end

    @tag :skip
    test "create_follow/1 with valid data creates a follow" do
      assert {:ok, %Follow{} = follow} = Account.create_follow(@valid_attrs)
    end

    @tag :skip
    test "create_follow/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_follow(@invalid_attrs)
    end

    @tag :skip
    test "update_follow/2 with valid data updates the follow" do
      follow = follow_fixture()
      assert {:ok, follow} = Account.update_follow(follow, @update_attrs)
      assert %Follow{} = follow
    end

    @tag :skip
    test "update_follow/2 with invalid data returns error changeset" do
      follow = follow_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_follow(follow, @invalid_attrs)
      assert follow == Account.get_follow!(follow.id)
    end

    @tag :skip
    test "delete_follow/1 deletes the follow" do
      follow = follow_fixture()
      assert {:ok, %Follow{}} = Account.delete_follow(follow)
      assert_raise Ecto.NoResultsError, fn -> Account.get_follow!(follow.id) end
    end

    @tag :skip
    test "change_follow/1 returns a follow changeset" do
      follow = follow_fixture()
      assert %Ecto.Changeset{} = Account.change_follow(follow)
    end
  end
end
