defmodule Recurse do
  def sum([head | tail], total) do
    IO.puts("Total: #{total} Head: #{head} Tail: #{inspect(tail)}")
    sum(tail, total + head)
  end

  def sum([], total), do: total

  def triple(list) do
    triple(list, [])
  end

  defp triple([head | tail], current_list) do
    triple([head * 3 | triple(tail)])
  end

  defp triple([], current_list) do
    current_list |> Enum.reverse()
  end

  def my_map([head | tail], fun) do
    [fun.(head) | my_map(tail, fun)]
  end

  def my_map([], _fun), do: []
end

# Recurse.sum([1, 2, 3, 4, 5], 0)
# IO.inspect Recurse.triple([1, 2, 3, 4, 5])
