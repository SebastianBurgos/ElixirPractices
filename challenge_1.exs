defmodule Challenge do

  def num_divisible_by_3_sequence(a, b) when a >= 1 and a <= b and b < 231 do
      #Initialize the sequence in ["1"] cause the sequence always starts like that
      sequence = construct_sequence(["1"], 1, a, b)  #The second parameter is the variable to concat since 1
      IO.inspect(sequence)
      divisible_by_3_sequence = Enum.filter(sequence, fn element -> rem(String.to_integer(element), 3) == 0 end)
      IO.puts("Number of divisibles by 3 elements in the sequence: #{length(divisible_by_3_sequence)}")
  end

  #Receive invalid parametres
  def num_divisible_by_3_sequence(_a, _b) do
    IO.puts("Valid numbers: (1 - 231)")
  end

  #Returns the last sequence constructed of the sequence when sumator == b, this is the final return of the recursion
  def construct_sequence(sequence, b, _a, b) do sequence end

  #Returns the last element of the sequence sent like parameter as a list to the recursion case when sumator == a
  #It sends a 0 to change the pattern matching but continue the sumator from a
  def construct_sequence(sequence, a, a, b) do
    construct_sequence([List.last(sequence)], a, 0, b)
  end

  #This is the metod wich construct the sequence, from the first element to the final element
  def construct_sequence(sequence, sumator, a, b) do
    sumator = sumator + 1
    sequence = sequence ++ [List.last(sequence) <> to_string(sumator)]
    construct_sequence(sequence, sumator, a, b)
  end
end

IO.inspect(Challenge.num_divisible_by_3_sequence(4, 14))
