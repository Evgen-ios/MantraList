//
//  MantraModel.swift
//  MantraList
//
//  Created by Evgeniy Goncharov on 02.02.2024.
//

import Foundation

typealias MantraModels = [MantraModel]

struct MantraModel: Codable {
    var name: String
    var duration: Int
}

