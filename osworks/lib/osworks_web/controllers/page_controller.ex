defmodule OsworksWeb.PageController do
  use OsworksWeb, :controller

  def home(conn, _params),      do: conn |> assign(:active_page, "home")      |> render(:home)
  def directory(conn, _params), do: conn |> assign(:active_page, "directory") |> render(:directory)
  def community(conn, _params), do: conn |> assign(:active_page, "community") |> render(:community)
  def showcase(conn, _params),  do: conn |> assign(:active_page, "showcase")  |> render(:showcase)
  def resources(conn, _params), do: conn |> assign(:active_page, "resources") |> render(:resources)
  def about(conn, _params),     do: conn |> assign(:active_page, "about")     |> render(:about)
end
