defmodule Playwright.ChannelOwner.BrowserType do
  use Playwright.ChannelOwner

  def new(parent, args) do
    channel_owner(parent, args)
  end

  def new_context(channel_owner) do
    Logger.info("creating new BrwoserContext for Browser: #{inspect(channel_owner)}")

    message = %{
      guid: channel_owner.guid,
      method: "newContext",
      params: %{sdkLanguage: "javascript", noDefaultViewport: false},
      metadata: %{stack: [], apiName: "browser.newContext"}
    }

    # TODO: Retrieve the "instance" once it's ready, and send to caller.
    # Note that, at the moment, we can get things from our GUID map for which
    # we know the GUID (top-level resources). That's not the case here.
    Connection.send_message(channel_owner.connection, message)
  end
end
