defmodule ChatterWeb.UserVisitsRoomsPageTest do
  use ChatterWeb.FeatureCase, async: true

  test "user can visits rooms page to see a list of rooms", %{session: session} do
    room = insert(:chat_room)

  # test "GET /", %{conn: conn} do
  #   conn = get(conn, ~p"/")
  #   assert html_response(conn, 200) =~ "Peace of mind from prototype to production"
  # end
    # |> visit(Routes.chat_room_path(@endpoint, :index))

    session
    |> visit(~p"/")
    |> assert_has(Query.css(".room", text: room.name))
  end
end
