defmodule GenServerMock do
  # https://medium.com/learn-elixir/genserver-explained-in-5-minutes-ae5823af4d44
  # GenServer is a module
  # :gen_server is a OTP Library
  #
  require Logger

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
    send pid, {:call, self(), arguments}
  end

  def init() do
    initial_state = 1
    loop(initial_state)
  end

  def loop(state) do
    Logger.info "::Loop::"
    receive do
      {:call, pid, :get_data} ->
        {new_state, response} = {state, state}
				IO.inspect "::get_data:: #{state}"
        send pid, {:response, state}
        loop(new_state)
      {:cast, :increment} ->
        new_state = state + 1
        loop(new_state)
    end
  end

end
