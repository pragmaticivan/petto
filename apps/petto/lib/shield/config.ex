defmodule Shield.Config do
  def front_end_base(), do: get_env(:petto, [:front_end, :base])
  def front_end_confirmation_path(), do: get_env(:petto, [:front_end, :confirmation_path])
  def front_end_reset_password_path(), do: get_env(:petto, [:front_end, :reset_password_path])

  defp get_env(config, [first_key | keys]) do
    Enum.reduce(keys, get_env(config, first_key), &get_env(&2, &1))
  end

  defp get_env(config, key) when is_atom(config) do
    config
    |> Application.get_env(key)
    |> get_value()
  end

  defp get_env(config, key) when is_map(config) do
    config
    |> Map.get(key)
    |> get_value()
  end

  defp get_value({:system, var, default}), do: System.get_env(var) || default
  defp get_value({:system, var}), do: System.get_env(var)
  defp get_value(value), do: value
end
