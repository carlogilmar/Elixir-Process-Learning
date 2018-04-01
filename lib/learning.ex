defmodule Learning do

  def loop(number) do
    IO.puts "Loop #{number}"
    Process.sleep 1_000
    loop( number + 1 )
  end

end
