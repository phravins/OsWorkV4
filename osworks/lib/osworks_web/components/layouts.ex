defmodule OsworksWeb.Layouts do
  @moduledoc false
  use OsworksWeb, :html

  embed_templates "layouts/*"

  attr :flash, :map, required: true
  attr :current_scope, :map, default: nil
  attr :active_page, :string, default: ""

  slot :inner_block, required: true

  def app(assigns) do
    ~H"""
    <nav>
      <.link navigate={~p"/"} class="logo">
        <div class="logo-badge">✦</div>OSWorks<em>.in</em>
      </.link>
      <div class="nav-links">
        <.link navigate={~p"/"}          class={"nb#{if @active_page == "home",      do: " on"}"}>Home</.link>
        <.link navigate={~p"/directory"} class={"nb#{if @active_page == "directory", do: " on"}"}>Directory</.link>
        <.link navigate={~p"/community"} class={"nb#{if @active_page == "community", do: " on"}"}>Community</.link>
        <.link navigate={~p"/showcase"}  class={"nb#{if @active_page == "showcase",  do: " on"}"}>Showcase</.link>
        <.link navigate={~p"/resources"} class={"nb#{if @active_page == "resources", do: " on"}"}>Resources</.link>
        <.link navigate={~p"/about"}     class={"nb#{if @active_page == "about",     do: " on"}"}>About</.link>
      </div>
      <div style="display:flex;gap:12px;align-items:center">
        <%= if assigns[:current_scope] do %>
          <span style="font-size:13px;color:var(--text-soft)">{@current_scope.user.email}</span>
          <.link href={~p"/users/settings"} style="font-size:13px;font-weight:600;color:var(--text-mid)">Settings</.link>
          <.link href={~p"/users/log_out"} method="delete" style="font-size:13px;font-weight:600;color:var(--text-mid)">Log out</.link>
        <% else %>
          <.link href={~p"/users/log-in"} style="font-size:13px;font-weight:600;color:var(--text-mid)">Log in</.link>
        <% end %>
        <button class="nav-cta">Join Community</button>
      </div>
    </nav>
    <main>
      <.flash_group flash={@flash} />
      {render_slot(@inner_block)}
    </main>
    """
  end

  attr :flash, :map, required: true
  attr :id, :string, default: "flash-group"

  def flash_group(assigns) do
    ~H"""
    <div id={@id} aria-live="polite">
      <.flash kind={:info} flash={@flash} />
      <.flash kind={:error} flash={@flash} />
      <.flash
        id="client-error"
        kind={:error}
        title={gettext("We can't find the internet")}
        phx-disconnected={show(".phx-client-error #client-error") |> JS.remove_attribute("hidden")}
        phx-connected={hide("#client-error") |> JS.set_attribute({"hidden", ""})}
        hidden
      >
        {gettext("Attempting to reconnect")}
        <.icon name="hero-arrow-path" class="ml-1 size-3 motion-safe:animate-spin" />
      </.flash>
      <.flash
        id="server-error"
        kind={:error}
        title={gettext("Something went wrong!")}
        phx-disconnected={show(".phx-server-error #server-error") |> JS.remove_attribute("hidden")}
        phx-connected={hide("#server-error") |> JS.set_attribute({"hidden", ""})}
        hidden
      >
        {gettext("Attempting to reconnect")}
        <.icon name="hero-arrow-path" class="ml-1 size-3 motion-safe:animate-spin" />
      </.flash>
    </div>
    """
  end
end
