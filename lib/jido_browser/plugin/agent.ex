defmodule Jido.Browser.Plugin.Agent do
  @moduledoc false

  alias Jido.Browser.Plugin
  alias Jido.Browser.Plugin.Profile

  def state_spec(opts) do
    config = Map.new(opts)
    :ok = Profile.reject_profile_option!(config)
    {:ok, state} = Plugin.mount(%{}, config)
    {:browser, Profile.state_schema() |> Zoi.default(state)}
  end

  def prepare(%Jido.Agent.Plugin.Preparation{plugin_state: state}, _opts), do: {:ok, state}

  def reduce(%Jido.Agent.Plugin.Reduction{plugin_state: state}, _opts), do: {:ok, state}
end
