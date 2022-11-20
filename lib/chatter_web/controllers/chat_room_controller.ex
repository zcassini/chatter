defmodule ChatterWeb.ChatRoomController do
  use ChatterWeb, :controller

  def index(conn, _params) do
    chat_rooms = Chatter.Chat.all_rooms()

    render(conn, "index.html", chat_rooms: chat_rooms)
  end

  def new(conn, _params) do
    changeset = Chatter.Chat.new_chat_room()
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"room" => room_params}) do
    case Chatter.Chat.create_chat_room(room_params) do
      {:ok, room} ->
        redirect(conn, to: ~p"/chat_rooms/#{room.id}")

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    chat_room = Chatter.Chat.find_room(id)

    render(conn, "show.html", chat_room: chat_room)
  end
end
