// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

protocol ExGraphQLAPI_SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == ExGraphQLAPI.SchemaMetadata {}

protocol ExGraphQLAPI_InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == ExGraphQLAPI.SchemaMetadata {}

protocol ExGraphQLAPI_MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == ExGraphQLAPI.SchemaMetadata {}

protocol ExGraphQLAPI_MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == ExGraphQLAPI.SchemaMetadata {}

extension ExGraphQLAPI {
  typealias SelectionSet = ExGraphQLAPI_SelectionSet

  typealias InlineFragment = ExGraphQLAPI_InlineFragment

  typealias MutableSelectionSet = ExGraphQLAPI_MutableSelectionSet

  typealias MutableInlineFragment = ExGraphQLAPI_MutableInlineFragment

  enum SchemaMetadata: ApolloAPI.SchemaMetadata {
    static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

    static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
      switch typename {
      case "Launch": return ExGraphQLAPI.Objects.Launch
      case "LaunchConnection": return ExGraphQLAPI.Objects.LaunchConnection
      case "Mission": return ExGraphQLAPI.Objects.Mission
      case "Mutation": return ExGraphQLAPI.Objects.Mutation
      case "Query": return ExGraphQLAPI.Objects.Query
      case "Rocket": return ExGraphQLAPI.Objects.Rocket
      case "Subscription": return ExGraphQLAPI.Objects.Subscription
      case "User": return ExGraphQLAPI.Objects.User
      default: return nil
      }
    }
  }

  enum Objects {}
  enum Interfaces {}
  enum Unions {}

}