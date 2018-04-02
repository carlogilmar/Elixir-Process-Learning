defmodule SimpleGenServerMock do

	# Gen server post https://medium.com/learn-elixir/genserver-explained-in-5-minutes-ae5823af4d44

   def start_link() do
       # runs in the caller context 🐌Alice
       spawn_link(__MODULE__, :init, [])
   end
   def call(pid, arguments) do
       # runs in the caller context 🐌Alice
       send pid, {:call, self(), arguments}
       receive do
         {:response, data} -> data
       end
   end
   def cast(pid, arguments) do
       # runs in the caller context 🐌Alice
       send pid, {:cast, arguments}
   end
   def init() do
      # runs in the server context 🐨Bob
      initial_state = 1
      loop(initial_state)
   end
   def loop(state) do
      # runs in the server context 🐨Bob
      receive do
         {:call, pid, :get_data} ->
           # do some work on data here and update state
           {new_state, response} = {state, state}
           send pid, {:response, response}
           loop(new_state)
         {:cast, :increment} ->
           # do some work on data here and update state
           new_state = state + 1
           loop(new_state)
      end
   end
end
