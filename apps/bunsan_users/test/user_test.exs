defmodule BunsanUsers.UserTest do
  use BunsanUsers.DataCase
  alias BunsanUsers.Repo
  alias BunsanUsers.User

  setup do
    user_chg = %BunsanUsers.User{}
    chg = BunsanUsers.User.signup_changeset(user_chg, %{name: "Misael",
                                                         age: 33,
                                                       email: "misa@misa.com"})
    user = Repo.insert!(chg)
    {:ok, user: user}
  end

  test "create user succesfully" do
    changeset = BunsanUsers.User.signup_changeset(%BunsanUsers.User{},%{name: "Victor",
                                                                         age: 28,
                                                                       email: "victor@victor.com"})
    assert changeset.valid? == true
  end

end