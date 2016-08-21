defmodule Rumbl.Repo do
  @moduledoc """
    In memory repository.
  """
  def all(Rumbl.User) do
    [
      %Rumbl.User{id: "1", name: "User01", username: "user01", password: "pass01"},
      %Rumbl.User{id: "2", name: "User02", username: "user02", password: "pass02"},
      %Rumbl.User{id: "3", name: "User03", username: "user03", password: "pass03"}
    ]
  end

  def all(_module), do: []

  def get(module, id) do
    Enum.find all(module), fn map -> map.id == id end
  end

  def get_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end
  end
end
