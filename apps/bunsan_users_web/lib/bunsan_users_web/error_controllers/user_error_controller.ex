defmodule BunsanUsersWeb.UserFallbackController do
  @moduledoc """
  Error controller for users
  """
  use BunsanUsersWeb, :controller

  def call(conn, {:error, changeset = %Ecto.Changeset{}}) do
    conn
      |> put_status(400)
      |> json(creation_error(changeset.errors))
  end

  def call(conn, {:error, error}) do
    conn
      |> put_status(400)
      |> json(%{error: error})
  end

  def creation_error(errors) do
    details =
    cond do
      is_binary(errors) ->
        %{error:  "#{inspect errors}"}
      is_list(errors) ->
        result = errors
        |> Enum.map(fn {k, v} ->
            "#{k}: #{inspect v}"
          end)
        |> Enum.join(", ")

        %{error:  "#{inspect result}"}
      :true ->
        errors
    end
    %{details: details}
  end
end