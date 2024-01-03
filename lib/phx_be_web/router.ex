defmodule PhxBeWeb.Router do
  use PhxBeWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", PhxBeWeb do
    pipe_through :api
  end
end
