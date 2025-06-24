defmodule ExAws.IAM.Parsers.PolicyTest do
  use ExUnit.Case

  import ExAws.IAM.TestHelper, only: [read_file: 2]

  alias ExAws.IAM.Parser

  test "put_user_policy/2" do
    xml = read_file("policy", "put_user_policy")
    response = {:ok, %{body: xml, status_code: 200}}

    expected =
      {:ok,
       %{
         body: %{
           response_metadata: %{request_id: "81ca4919-d3fb-11e8-986e-5fbe089ad211"}
         },
         status_code: 200
       }}

    assert expected == Parser.parse(response, "PutUserPolicy")
  end
end
