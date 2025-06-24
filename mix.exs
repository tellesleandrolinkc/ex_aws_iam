defmodule IAM.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_aws_iam,
      version: "1.0.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      description: description(),
      deps: deps(),
      name: "ExAws.IAM",
      source_url: "https://github.com/tellesleandrolinkc/ex_aws_iam.git",
      homepage_url: "https://github.com/tellesleandrolinkc/ex_aws_iam.git",
      package: package(),
      docs: [
        main: "readme",
        extras: ["README.md"]
      ]
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
      {:ex_aws, "~> 2.5"},
      {:ex_doc, "~> 0.38", only: :dev, runtime: false, warn_if_outdated: true},
      {:sweet_xml, "~> 0.7"}
    ]
  end

  defp description do
    "An ExAws service module to interact with AWS IAM"
  end

  defp package do
    [
      licenses: ["MIT"],
      maintainers: ["Leandro Telles"],
      links: %{github: "https://github.com/tellesleandrolinkc/ex_aws_iam"}
    ]
  end
end
