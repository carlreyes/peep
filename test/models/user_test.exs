defmodule Peepchat.UserTest do
  use Peepchat.ModelCase

  alias Peepchat.User

  @valid_attrs %{
    email: "foo@bar.com",
    password: "abcd1234",
    password_confirmation: "abcd1234"
  }
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "mis-matched password_confirmation doesn't work" do
    changeset = User.changeset(%User{}, %{email: "foo@bar.com",
      password: "abcd1234",
      password_confirmation: "1234abcd"})
    refute changeset.valid?
  end

  test "missing password_confirmation doesn't work" do
    changeset = User.changeset(%User{}, %{
        email: "foo@bar.com",
        password: "abcd1234"
      })
    refute changeset.valid?
  end

  test "short password doesn't work" do
    changeset = User.changeset(%User{}, %{
        email: "foo@bar.com",
        password: "abc123",
        password_confirmation: "abc123"
      })
    refute changeset.valid?
  end
end
