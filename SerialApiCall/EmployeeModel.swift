//
//  EmployeeModel.swift
//  SerialApiCall
//
//  Created by shubhan.langade on 18/02/23.
//

import Foundation
struct Employee: Codable {
    let errorMessage: String
    let data: [EmployeeData]
}

// MARK: - Datum
struct EmployeeData: Codable {
    let name, email, id, joining: String
}
