//
//  Cancellable+Extension.swift
//  ExGraphQL
//
//  Created by Harvin Shibu on 09/06/25.
//

import Combine
import Apollo

final class ApolloCancellableWrapper: Combine.Cancellable {
    private let apolloCancellable: Apollo.Cancellable

    init(_ apolloCancellable: Apollo.Cancellable) {
        self.apolloCancellable = apolloCancellable
    }

    func cancel() {
        apolloCancellable.cancel()
    }
}
