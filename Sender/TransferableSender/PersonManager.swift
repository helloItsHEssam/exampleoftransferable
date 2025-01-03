//
//  PersonManager.swift
//  TransferableSender
//
//  Created by HEssam on 1/2/25.
//

import SwiftUI

@Observable
class PersonManager {
    private(set) var persons: [Person] = []
    
    func addNewPerson(_ person: Person) {
        persons.append(person)
    }
}

extension EnvironmentValues {
    @Entry var personManager = PersonManager()
}
