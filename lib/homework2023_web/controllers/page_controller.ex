defmodule Homework2023Web.PageController do
  use Homework2023Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
