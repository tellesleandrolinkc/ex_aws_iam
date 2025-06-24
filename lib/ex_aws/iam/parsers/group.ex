defmodule ExAws.IAM.Parsers.Group do
  @moduledoc """
  Defines parsers for handling AWS IAM `Group` query reponses.

  """

  import SweetXml, only: [sigil_x: 2]
  import ExAws.IAM.Utils, only: [response_metadata_path: 0]

  @doc """
  Parses XML from IAM `ListGroups` response.
  Parses XML from IAM `GetGroup` response.
  Parses XML from IAM `CreateGroup` response.

  """
  def parse(xml, "ListGroups") do
    SweetXml.xpath(xml, ~x"//ListGroupsResponse",
      list_groups_result: [
        ~x"//ListGroupsResult",
        is_truncated: ~x"./IsTruncated/text()"s,
        marker: ~x"./Marker/text()"o,
        groups: [
          ~x"./Groups/member"l,
          path: ~x"./Path/text()"s,
          group_name: ~x"./GroupName/text()"s,
          arn: ~x"./Arn/text()"s,
          group_id: ~x"./GroupId/text()"s,
          create_date: ~x"./CreateDate/text()"s
        ]
      ],
      response_metadata: response_metadata_path()
    )
  end

  def parse(xml, "GetGroup") do
    SweetXml.xpath(xml, ~x"//GetGroupResponse",
      get_group_result: [
        ~x"//GetGroupResult",
        group: group_path()
      ],
      response_metadata: response_metadata_path()
    )
  end

  def parse(xml, "CreateGroup") do
    SweetXml.xpath(xml, ~x"//CreateGroupResponse",
      create_group_result: [
        ~x"//CreateGroupResult",
        group: group_path()
      ],
      response_metadata: response_metadata_path()
    )
  end

  defp group_path do
    [
      ~x"//Group",
      path: ~x"./Path/text()"s,
      group_name: ~x"./GroupName/text()"s,
      arn: ~x"./Arn/text()"s,
      group_id: ~x"./GroupId/text()"s,
      create_date: ~x"./CreateDate/text()"s
    ]
  end
end
