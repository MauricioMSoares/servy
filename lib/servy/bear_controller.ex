defmodule Servy.BearController do
  alias Servy.Wildthings
  alias Servy.Bear

  defp bear_item(bear) do
    "<li>#{bear.name} - #{bear.type}</li>"
  end

  def index(conv) do
    content =
      Wildthings.list_bears()
      |> Enum.filter(&Bear.is_entity?/1)
      |> Enum.sort(&Bear.order_asc_by_name/2)
      |> Enum.map(&bear_item/1)
      |> Enum.join
      
    %{ conv | status: 200, resp_body: "<ul>#{content}</ul>" }
  end

  def show(conv, %{"id" => id}) do
    bear = Wildthings.get_bear(id)
    %{ conv | status: 200, resp_body: "<h1>Bear #{bear.id}: #{bear.name}</h1>" }
  end

  def create(conv, %{"name" => name, "type" => type} = params) do
    %{ conv | status: 201, resp_body: "The bear #{name} of type #{type} has been created." }
  end
end
