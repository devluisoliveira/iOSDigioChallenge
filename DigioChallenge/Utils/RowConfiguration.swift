//
//  RowConfiguration.swift
//  DigioChallenge
//
//  Created by Luis Eduardo Silva Oliveira on 23/02/22.
//

import Foundation

enum Actions {
    case firstSection
    case secondSection
    case thirtSections
}

struct RowCollection {
    var forCellWithReuseIdentifier: String!
    var label: String
    var action: Actions!
    
    init(_ forCellWithReuseIdentifier: String, _ label: String, _ action: Actions) {
        self.forCellWithReuseIdentifier = forCellWithReuseIdentifier
        self.label = label
        self.action = action
    }
}

var sectionsCollections: [RowCollection] = []
var rowsCollection: [[RowCollection]] = []
