//
//  ProjectModel.swift
//  SerialApiCall
//
//  Created by shubhan.langade on 18/02/23.
//

import Foundation

struct Project: Codable {
    let id: Int
    let name, description: String
    let isActive: Bool
    let startDate: String
    let endDate: String?
}
