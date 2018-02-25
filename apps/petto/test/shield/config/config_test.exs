defmodule Shield.Config.ConfigTest do
  use ExUnit.Case, async: true

  alias Shield.Config

  describe "front_end" do
    test "base" do
      test_config(
        :front_end,
        &Config.front_end_base/0,
        &(%{base: &1}),
        "front_end_base_test_value",
        "front_end_base_test_default_value",
        "SHIELD_TEST_FRONT_END_BASE"
      )
    end

    test "confirmation_path" do
      test_config(
        :front_end,
        &Config.front_end_confirmation_path/0,
        &(%{confirmation_path: &1}),
        "front_end_confirmation_path_test_value",
        "front_end_confirmation_path_test_default_value",
        "SHIELD_TEST_FRONT_END_CONFIRMATION_PATH"
      )
    end

    test "reset_password_path" do
      test_config(
        :front_end,
        &Config.front_end_reset_password_path/0,
        &(%{reset_password_path: &1}),
        "front_end_reset_password_path_test_value",
        "front_end_reset_password_path_test_default_value",
        "SHIELD_TEST_FRONT_END_RESET_PASSWORD_PATH"
      )
    end
  end

  defp test_config(key, configfn, create_config, val, default_val, env_var) do
      Application.put_env(:petto, key, create_config.(val))
      assert configfn.() == val

      Application.put_env(:petto, key, create_config.({:system, env_var, default_val}))
      assert configfn.() == default_val

      System.put_env(env_var, val)
      assert configfn.() == val
  end
end
