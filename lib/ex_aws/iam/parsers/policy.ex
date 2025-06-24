defmodule ExAws.IAM.Parsers.Policy do
  @moduledoc """
  Defines parsers for handling AWS IAM `Policy` query reponses.

  """

  import SweetXml, only: [sigil_x: 2]
  import ExAws.IAM.Utils, only: [response_metadata_path: 0]

  @doc """
  Parses XML from IAM `PutUserPolicy` response.

  """
  def parse(xml, "PutUserPolicy") do
    SweetXml.xpath(xml, ~x"//PutUserPolicyResponse",
      response_metadata: response_metadata_path()
    )
  end
end
