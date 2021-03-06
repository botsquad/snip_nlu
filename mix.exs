defmodule SnipsNlu.MixProject do
  use Mix.Project

  def project do
    [
      app: :snips_nlu,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      compilers: [:rustler] ++ Mix.compilers(),
      rustler_crates: rustler_crates()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:rustler, "~> 0.18"},
      {:jason, "~> 1.0", only: :test}
    ]
  end

  defp rustler_crates do
    [
      snips_nlu_native: [
        path: "native/snips_nlu_native",
        mode: rustc_mode(Mix.env())
      ]
    ]
  end

  defp rustc_mode(:prod), do: :release
  defp rustc_mode(_), do: :debug
end
