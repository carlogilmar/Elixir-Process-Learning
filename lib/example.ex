defmodule Example do

  # This would be a process
  # p = spawn(Example, :loop, [])
  # send(p, {:pong, p})
  # send(p, {:ping, p})
  def loop do
    receive do
      {:ping} -> IO.puts "Ping!!"
      {:pong} -> IO.puts "Pong!!"
    end
  end

end
