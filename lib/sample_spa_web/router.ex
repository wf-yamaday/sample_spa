defmodule SampleSpaWeb.Router do
  use SampleSpaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SampleSpaWeb do
    pipe_through :api
    
    scope "/boards" do
      get "/", BoardController, :index
      post "/", BoardController, :create
      get "/:id", BoardController, :show
      post "/:id", BoardController, :create_post
    end
  end

  scope "/", SampleSpaWeb do
    pipe_through :browser

    # get "/", PageController, :index
    get "/*path", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", SampleSpaWeb do
  #   pipe_through :api
  # end
end
