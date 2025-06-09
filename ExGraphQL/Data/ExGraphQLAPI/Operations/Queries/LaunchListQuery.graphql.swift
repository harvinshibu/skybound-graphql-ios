// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension ExGraphQLAPI {
  class LaunchListQuery: GraphQLQuery {
    static let operationName: String = "LaunchList"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query LaunchList($cursor: String) { launches(after: $cursor) { __typename cursor hasMore launches { __typename id site mission { __typename name missionPatch(size: SMALL) } } } }"#
      ))

    public var cursor: GraphQLNullable<String>

    public init(cursor: GraphQLNullable<String>) {
      self.cursor = cursor
    }

    public var __variables: Variables? { ["cursor": cursor] }

    struct Data: ExGraphQLAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { ExGraphQLAPI.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("launches", Launches.self, arguments: ["after": .variable("cursor")]),
      ] }

      var launches: Launches { __data["launches"] }

      /// Launches
      ///
      /// Parent Type: `LaunchConnection`
      struct Launches: ExGraphQLAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { ExGraphQLAPI.Objects.LaunchConnection }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("cursor", String.self),
          .field("hasMore", Bool.self),
          .field("launches", [Launch?].self),
        ] }

        var cursor: String { __data["cursor"] }
        var hasMore: Bool { __data["hasMore"] }
        var launches: [Launch?] { __data["launches"] }

        /// Launches.Launch
        ///
        /// Parent Type: `Launch`
        struct Launch: ExGraphQLAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { ExGraphQLAPI.Objects.Launch }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", ExGraphQLAPI.ID.self),
            .field("site", String?.self),
            .field("mission", Mission?.self),
          ] }

          var id: ExGraphQLAPI.ID { __data["id"] }
          var site: String? { __data["site"] }
          var mission: Mission? { __data["mission"] }

          /// Launches.Launch.Mission
          ///
          /// Parent Type: `Mission`
          struct Mission: ExGraphQLAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: any ApolloAPI.ParentType { ExGraphQLAPI.Objects.Mission }
            static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("name", String?.self),
              .field("missionPatch", String?.self, arguments: ["size": "SMALL"]),
            ] }

            var name: String? { __data["name"] }
            var missionPatch: String? { __data["missionPatch"] }
          }
        }
      }
    }
  }

}