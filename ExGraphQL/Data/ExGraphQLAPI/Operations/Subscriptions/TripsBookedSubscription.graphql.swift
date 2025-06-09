// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

extension ExGraphQLAPI {
  class TripsBookedSubscription: GraphQLSubscription {
    static let operationName: String = "TripsBooked"
    static let operationDocument: ApolloAPI.OperationDocument = .init(
      definition: .init(
        #"subscription TripsBooked { tripsBooked }"#
      ))

    public init() {}

    struct Data: ExGraphQLAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: any ApolloAPI.ParentType { ExGraphQLAPI.Objects.Subscription }
      static var __selections: [ApolloAPI.Selection] { [
        .field("tripsBooked", Int?.self),
      ] }

      var tripsBooked: Int? { __data["tripsBooked"] }
    }
  }

}