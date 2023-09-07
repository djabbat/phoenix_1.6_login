defmodule SampleAppWeb.ConnTestHelpers do
  def is_logged_in?(conn) do
    conn.assigns.current_user != nil
  end
end
