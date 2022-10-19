defmodule Challenge do

  def num_divisible_by_3_sequence(a, b) when a >= 1 and a <= b and b < 231 do
      #Initialize the sequence in ["1"] cause the sequence always starts like that
      sequence = obtain_sequence(["1"], 1, a, b)  #The second parameter is the variable to concat since 1
      IO.inspect(sequence)
      divisible_by_3_sequence = Enum.filter(sequence, fn element -> rem(String.to_integer(element), 3) == 0 end)
      IO.puts("Number of divisibles by 3 elements in the sequence: #{length(divisible_by_3_sequence)}")
  end

  #Receive invalid parametres with a guard
  def num_divisible_by_3_sequence(a, b) when a >= 1 or a <= b or b < 231 do
    IO.puts("Valid numbers: (1 - 231)")
  end

  #This part will receive the first part with the sequence initialized in ["1"] and the var ini in 1
  def obtain_sequence(sequence, initial_concatenator, a, b) do
    first_element = List.last(obtain_first_sequence(sequence, initial_concatenator, a)) #Get the first element of the final sequence (the last from the first sequence)
    construct_sequence([first_element], a, b) #Construct the final sequence since the first element
  end

  #Returns the first sequence when the sumator == a
  def obtain_first_sequence(sequence, a, a) do sequence end

  def obtain_first_sequence(sequence, sumator, a) do
    sumator = sumator + 1
    sequence = sequence ++ [List.last(sequence) <> to_string(sumator)]
    obtain_first_sequence(sequence, sumator, a)
  end

  #Returns the sequence
  def construct_sequence(sequence, b, b) do sequence end

  def construct_sequence(sequence, sumator_from_a, b) do
    sumator_from_a = sumator_from_a + 1
    sequence = sequence ++ [List.last(sequence) <> to_string(sumator_from_a)]
    construct_sequence(sequence, sumator_from_a, b)
  end
end

IO.inspect(Challenge.num_divisible_by_3_sequence(7, 14))
