defmodule SimpleGenserver do

  # POST https://medium.com/learn-elixir/genserver-explained-in-5-minutes-ae5823af4d44

  require Logger
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [])
  end

  def init(_) do
    {:ok, 1}
  end

  def handle_call(:get_data, _, state) do
    # this runs in the server context
    {:reply, state, state}
  end

  def handle_cast(:increment, state) do
    {:noreply, state + 1}
  end

  def handle_something() do
    {:reply, "I'm a simple handle action reply"}
  end

  def handle_something(:giveMe) do
    {:reply, "Give me the power!!!"}
  end

end

#iex(1)> pid = SimpleGenServer.start_link
##PID<0.128.0>
#iex(3)> counter = SimpleGenServer.call(pid, :get_data)
#1
#iex(4)> SimpleGenServer.cast(pid, :increment)
#iex(5)> counter = SimpleGenServer.call(pid, :get_data)
#2
