defmodule Along.Adapters.Travis do
  def run_build(build_spec) do
    build_spec =
      build_spec ||
        %{
          message: "Override the commit message: this is an api request",
          branch: "demo",
          config: %{
            env: %{
              KIM_SHA: "123123123123123",
              KIMLEXIR_SHA: "32132132132313123"
            }
          }
        }

    TravisEx.Requests.create(build_spec, "dicefm/olly", build_client)
  end

  def get_repo() do
    TravisEx.Repos.get("dicefm/kimlexir", build_client)
  end

  defp build_client do
    TravisEx.Client.new(
      auth: config(:token),
      endpoint: :pro
    )
  end

  defp config(name), do: Application.get_env(:along, __MODULE__) |> Keyword.get(name)
end
