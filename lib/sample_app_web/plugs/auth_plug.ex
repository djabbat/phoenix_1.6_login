defmodule SampleAppWeb.AuthPlug do
  import Plug.Conn
  alias SampleApp.Accounts

  def init(opts), do: opts

  def call(conn, _opts) do
    user_id = get_session(conn, :user_id)
    user = user_id && Accounts.get_user(user_id)
    assign(conn, :current_user, user)
  end

  # Logs in the given user.
  def login(conn, user) do
    conn
    |> assign(:current_user, user)
    |> put_session(:user_id, user.id)
    |> configure_session(renew: true)
  end

    # Logs out the current user.
    def logout(conn) do
      conn
      |> configure_session(drop: true)
      |> assign(:current_user, nil)
    end
end
