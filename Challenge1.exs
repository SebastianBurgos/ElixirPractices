defmodule Challenge do
  def num_divisible_by_3_sequence(a, b) do
    if a >= 1 and a <= b and b < 231 do
      sequence = ["1"]
      ini = 1
      con = 0
      sequence = construct_sequence(sequence, ini, a, b, con)
      IO.inspect(sequence)
      IO.puts("Number of divisibles by 3 elements in the sequence: #{Enum.reduce(Enum.filter(sequence, fn element -> rem(String.to_integer(element), 3) == 0 end), 0, fn _element_, acc -> acc + 1 end)}")
    else
      IO.puts("Valid Numbers: (a >= 1 y b < 231)")
    end
  end

  def construct_sequence(sequence, ini, a, b, con) do
    first_element = obtain_first_element(sequence, ini, a)
    sequence = [first_element]
    construct_sequence(sequence, a, b, con)
  end

  def obtain_first_element(sequence, ini, a) do
    last_element = List.last(sequence)
    if ini == a do last_element else
      ini = ini + 1
      sequence = sequence ++ [last_element <> to_string(ini)]
      obtain_first_element(sequence, ini, a)
    end
  end

  def construct_sequence(sequence, ini_a, b, con) do
    last_element = List.last(sequence)
    if ini_a == b do sequence else
      ini_a = ini_a + 1
      sequence = sequence ++ [last_element <> to_string(ini_a)]
      construct_sequence(sequence, ini_a, b, con)
    end
  end
end

#IO.inspect(Challenge.num_divisible_by_3_sequence(7, 11))
