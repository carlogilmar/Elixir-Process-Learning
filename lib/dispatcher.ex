defmodule Dispatcher do

    def init do
      server_process = spawn( Dispatcher, :server, [])
      send( server_process, {"Puedes verme???"})
    end

    def server do
      receive do
        {message} -> IO.puts ".:::Server Receive: #{message}:::."
      end
    end

end
