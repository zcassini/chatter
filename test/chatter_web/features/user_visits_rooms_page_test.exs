defmodule ChatterWeb.UserVisitsRoomsPageTest do
  use ChatterWeb.FeatureCase, async: true

  test "user can visits rooms page to see a list of rooms", %{session: session} do
    [room1, room2] = insert_pair(:chat_room)
    # |> visit(Routes.chat_room_path(@endpoint, :index))

    session
    |> visit(rooms_index())
    |> assert_has(room_name(room1))
    |> assert_has(room_name(room2))
  end

  defp rooms_index do
    ~p"/"
  end

  defp room_name(room) do
    Query.data("role", "room", text: room.name)
  end
end
