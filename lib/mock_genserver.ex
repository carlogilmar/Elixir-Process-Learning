defmodule SimpleGenServerMock do

	# Gen server post https://medium.com/learn-elixir/genserver-explained-in-5-minutes-ae5823af4d44

   def start_link() do
       spawn_link(__MODULE__, :init, [])
   end
   def call(pid, arguments) do
       send pid, {:call, self(), arguments}
       receive do
         {:response, data} -> data
       end
   end
   def cast(pid, arguments) do
       send pid, {:cast, arguments}
   end
   def init() do
      initial_state = 1
      loop(initial_state)
   end
   def loop(state) do
      receive do
         {:call, pid, :get_data} ->
           {new_state, response} = {state, state}
           send pid, {:response, response}
           loop(new_state)
         {:cast, :increment} ->
           new_state = state + 1
           loop(new_state)
      end
   end
end
