defmodule MarusyaWeb.Router do
  use MarusyaWeb, :router

  # Our pipeline implements "maybe" authenticated. We'll use the `:ensure_auth` below for when we need to make sure someone is logged in.
  pipeline :auth do
    plug Marusya.Accounts.Pipeline
  end

  # We use ensure_auth to fail if there is no one logged in
  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

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

  scope "/", MarusyaWeb do
    pipe_through [:browser, :auth]

    get "/", PageController, :index

    resources "/users", UserController

    get "/login", SessionController, :new
    post "/login", SessionController, :login
    get "/logout", SessionController, :logout
  end

  # Definitely logged in scope
  scope "/", MarusyaWeb do
    pipe_through [:browser, :auth, :ensure_auth]

    get "/secret_temp", PageController, :secret_temp
  end

  # Other scopes may use custom stacks.
  # scope "/api", MarusyaWeb do
  #   pipe_through :api
  # end
end
