defmodule MicroblogWeb.PageController do
  use MicroblogWeb, :controller

  def index(conn, _params) do
  	if get_session(conn, :user_id) do
  		redirect conn, to: user_path(conn, :show, get_session(conn, :user_id))
    else
    	redirect conn, to: user_path(conn, :new)
  	end
  end
end
