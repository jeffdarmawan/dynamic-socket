defmodule DynamicSocketWeb.Router do
  use DynamicSocketWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", DynamicSocketWeb do
    pipe_through :api
  end
end
