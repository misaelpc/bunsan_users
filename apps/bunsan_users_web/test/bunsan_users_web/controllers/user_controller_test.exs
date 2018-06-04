defmodule BunsanUsersWeb.UserControllerTest do
  use BunsanUsersWeb.ConnCase

  test "Driver Order" do
    conn = build_conn()
      |> get("/api/v1/users")
    body = json_response(conn, 200)
    assert %{"users" => []} == body
  end

end