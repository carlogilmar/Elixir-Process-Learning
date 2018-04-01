defmodule Learning do

  def loop(number) do
    IO.puts "Loop #{number}"
    Process.sleep 1_000
    loop( number + 1 )
  end

  def lonely_loop(n\\0) do
    IO.inspect n
    Process.sleep 1_000
    lonely_loop(n+1)
  end

  #IO.inspect spawn(&Learning.lonely_loop/0)
  #PID<0.123.0>

end
