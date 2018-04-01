defmodule Example do

  # This would be a process
  # p = spawn(Example, :loop, [])
  # send(p, {:pong, p})
  # send(p, {:ping, p})
  def loop do
    receive do
      {:ping, process} ->
        IO.puts "Ping!!"
        sender {process, :pong}
        loop()

      {:pong, process} ->
        IO.puts "Pong!!"
        sender {process, :ping}
        loop()
    end
  end

  def sender({process, msg}) do
    IO.puts "Sending to mailbox"
    :timer.sleep(500)
    IO.puts "..."
    :timer.sleep(500)
    IO.puts "..."
    :timer.sleep(500)
    IO.puts "..."
    send(process, {msg, process})
  end

end
