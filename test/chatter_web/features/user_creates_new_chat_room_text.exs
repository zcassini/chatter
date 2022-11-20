defmodule ChatterWeb.UserCreatesNewChatRoomTest do
  use ChatterWeb.FeatureCase, async: true

  test "user can create a new chat room", %{session: session} do
    session
    |> visit(rooms_index())
    |> click(new_room_link())
    |> create_chat_room(name: "elixir")
    |> assert_has(room_title("elixir"))
  end

  defp rooms_index do
    ~p"/"
  end

  defp new_room_link, do: Query.link("New chat room")

  defp create_chat_room(session, name: name) do
    session
    |> fill_in(Query.text_field("Name"), with: name)
    |> click(Query.button("Submit"))
  end

  defp room_title(title), do: Query.data("role", "room-title", text: title)
end
