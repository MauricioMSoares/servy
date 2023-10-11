defmodule Servy.Wildthings do
  alias Servy.Bear

  def list_bears do
    [
      %Bear{id: 1, name: "Tibbers", type: "Entity"},
      %Bear{id: 2, name: "Freddy", type: "Mecha"},
      %Bear{id: 3, name: "Snow", type: "Polar", hibernating: true},
      %Bear{id: 4, name: "Volibear", type: "Entity", hibernating: true}
    ]
  end

  def get_bear(id) when is_integer(id) do
    Enum.find(list_bears(), fn(bear) -> bear.id == id end)
  end

  def get_bear(id) when is_binary(id) do
    id
    |> String.to_integer
    |> get_bear
  end
end
