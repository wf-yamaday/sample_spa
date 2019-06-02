defmodule SampleSpaWeb.PageController do
  use SampleSpaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
