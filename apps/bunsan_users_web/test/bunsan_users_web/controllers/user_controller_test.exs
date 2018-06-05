defmodule BunsanUsersWeb.UserControllerTest do
  use BunsanUsersWeb.ConnCase

  setup do
    user = %BunsanUsers.User{}
    user_chg = BunsanUsers.User.signup_changeset(user, %{"name" => "Julio", "age" => 33, "email" => "julio@julio.com"})
    stored_user = BunsanUsers.Repo.insert!(user_chg)
    {:ok, user: stored_user}
  end

  test "User Creation Succesfullu" do
    conn = build_conn()
      |> put_req_header("content-type", "application/json")
      |> post("/api/v1/users", create_user_request_body())
    conn
      |> response(201)
  end

  test "Find user test", %{user: user} do
    conn = build_conn()
      |> get("/api/v1/users/#{user.id}")
    conn
      |> response(200)
  end
  #Realizar test end point all_users / assert vs body content
  #Bonus alcanza Mayor cobertura en la app Web ¿?

  def create_user_request_body do
    ~s({
      "user": {
        "name": "Grizz",
        "email": "jorge@bunsan.io",
        "age": "24"}
      })
  end
end