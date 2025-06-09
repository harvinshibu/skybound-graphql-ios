// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension ExGraphQLAPI {
  class LaunchDetailsQuery: GraphQLQuery {
    static let operationName: String = "LaunchDetails"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"query LaunchDetails($launchId: ID!) { launch(id: $launchId) { __typename id site mission { __typename name missionPatch(size: LARGE) } rocket { __typename name type } isBooked } }"#
      ))

    public var launchId: ID

    public init(launchId: ID) {
      self.launchId = launchId
    }

    public var __variables: Variables? { ["launchId": launchId] }

    struct Data: ExGraphQLAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { ExGraphQLAPI.Objects.Query }
      static var __selections: [ApolloAPI.Selection] { [
        .field("launch", Launch?.self, arguments: ["id": .variable("launchId")]),
      ] }

      var launch: Launch? { __data["launch"] }

      /// Launch
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
          .field("rocket", Rocket?.self),
          .field("isBooked", Bool.self),
        ] }

        var id: ExGraphQLAPI.ID { __data["id"] }
        var site: String? { __data["site"] }
        var mission: Mission? { __data["mission"] }
        var rocket: Rocket? { __data["rocket"] }
        var isBooked: Bool { __data["isBooked"] }

        /// Launch.Mission
        ///
        /// Parent Type: `Mission`
        struct Mission: ExGraphQLAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { ExGraphQLAPI.Objects.Mission }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("name", String?.self),
            .field("missionPatch", String?.self, arguments: ["size": "LARGE"]),
          ] }

          var name: String? { __data["name"] }
          var missionPatch: String? { __data["missionPatch"] }
        }

        /// Launch.Rocket
        ///
        /// Parent Type: `Rocket`
        struct Rocket: ExGraphQLAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: any ApolloAPI.ParentType { ExGraphQLAPI.Objects.Rocket }
          static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("name", String?.self),
            .field("type", String?.self),
          ] }

          var name: String? { __data["name"] }
          var type: String? { __data["type"] }
        }
      }
    }
  }

}