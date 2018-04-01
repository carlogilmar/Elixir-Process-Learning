# https://medium.com/elixirlabs/when-to-use-processes-in-elixir-18287da73d47

defmodule Storage do
	def start(initial) do
		process = spawn_link(fn -> execute(initial) end)
		Process.register(process, Storage)
		process
	end

	def execute(state) do
		receive do
			{:get, sender} ->
				send(sender, state)
				execute(state)
			{:put, val} ->
				execute(state ++ [val])
		end
	end

	def put(value) do
		send(Storage, {:put, value})
	end

	def get do
		send(Storage, {:get, self()})
		receive do
			msg -> msg
		end
	end
end
