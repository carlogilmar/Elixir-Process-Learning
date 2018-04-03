defmodule Pingpong do

  def init() do
    ping = spawn(Pingpong, :mailbox, [])
    pong = spawn(Pingpong, :mailbox, [])
    send( ping, {:ping, ping, pong})
  end

  def mailbox() do
    IO.inspect self()
    receive do
      {:ping, process1, process2} ->
        :timer.sleep(500)
        IO.puts " Ping !!"
        send(process2, {:pong, process1, process2})
        mailbox()

      {:pong, process1, process2} ->
        :timer.sleep(500)
        IO.puts " Pong !!"
        send(process1, {:ping, process1, process2})
        mailbox()
    end
  end

end
