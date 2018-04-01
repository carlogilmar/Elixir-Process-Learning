defmodule Example do

  # This would be a process
  # p = spawn(Example, :loop, [])
  # send(p, {:pong, p})
  # send(p, {:ping, p})
  def start() do
    ping_pong_process = spawn(Example, :loop, [])
    sender {ping_pong_process, 0, :ping}
  end

  def loop do
    receive do
      {:ping, counter, process} ->
        IO.puts "Ping!! #{counter}"
        sender {process, counter+1, :pong}
        loop()

      {:pong, counter, process} ->
        IO.puts "Pong!! #{counter}"
        sender {process, counter+1, :ping}
        loop()
    end
  end

  def sender({process, counter, msg}) do
    IO.puts "Sending to mailbox"
    :timer.sleep(500)
    IO.puts "..."
    :timer.sleep(500)
    IO.puts "..."
    :timer.sleep(500)
    IO.puts "..."
    send(process, {msg, counter, process})
  end

end
