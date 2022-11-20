defmodule ChatterWeb.FeatureCase do

  use ExUnit.CaseTemplate

  using do
    quote do
      # The default endpoint for testing
      @endpoint ChatterWeb.Endpoint

      use Wallaby.DSL
      use ChatterWeb, :verified_routes

      alias ChatterWeb.Router.Helpers, as: Routes

      import Chatter.Factory

    end
  end

  setup tags do
    # Chatter.DataCase.setup_sandbox(tags)
    # {:ok, conn: Phoenix.ConnTest.build_conn()}

    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Chatter.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Chatter.Repo, {:shared, self()})
    end

    metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(Chatter.Repo, self())
    {:ok, session} = Wallaby.start_session(metadata: metadata)
    {:ok, session: session}
  end
end
