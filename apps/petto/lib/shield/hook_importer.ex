defmodule Shield.HookImporter do
  @moduledoc """
  Dynamically import Shield Hooks into modules.
  ### Examples

      defmodule SomeModule do
        use Shield.HookImporter
        ...

        def xyz do
          token = ...
          ...
          @hooks.after_user_login_token_success(token)
          ...
        end
      end
  """
  defmacro __using__(_) do
    quote do
      # import unquote(Application.get_env(:petto, :hooks))
      @hooks Application.get_env(:petto, :hooks)
    end
  end
end
