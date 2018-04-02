defmodule Dispatcher do

    def start do
      spawn( Dispatcher, :server, [])
    end

    def server do
      receive do
        {:message, message} ->
          IO.puts ".:::Server Receive: #{message}:::."
        {:servers, server_info} ->
          IO.puts "New server: #{server_info.name}"
      end
    end

end
