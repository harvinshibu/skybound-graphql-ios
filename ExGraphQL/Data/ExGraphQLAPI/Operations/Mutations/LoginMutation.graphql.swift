// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension ExGraphQLAPI {
  class LoginMutation: GraphQLMutation {
    static let operationName: String = "Login"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"mutation Login($email: String!) { login(email: $email) { __typename token } }"#
      ))

    public var email: String

    public init(email: String) {
      self.email = email
    }

    public var __variables: Variables? { ["email": email] }

    struct Data: ExGraphQLAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { ExGraphQLAPI.Objects.Mutation }
      static var __selections: [ApolloAPI.Selection] { [
        .field("login", Login?.self, arguments: ["email": .variable("email")]),
      ] }

      var login: Login? { __data["login"] }

      /// Login
      ///
      /// Parent Type: `User`
      struct Login: ExGraphQLAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: any ApolloAPI.ParentType { ExGraphQLAPI.Objects.User }
        static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("token", String?.self),
        ] }

        var token: String? { __data["token"] }
      }
    }
  }

}