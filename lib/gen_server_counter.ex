defmodule SimpleGenserver do

  require Logger
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [])
  end

  def init(_) do
    {:ok, 1}
  end

  def handle_call do
  end

  def handle_cast do
  end

end
