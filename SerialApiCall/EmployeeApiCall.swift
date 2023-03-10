//
//  EmployeeApiCall.swift
//  SerialApiCall
//
//  Created by shubhan.langade on 18/02/23.
//

import Foundation

class EmployeeApiCall{
    func getDataOfEmployee(completionHandler : @escaping ([EmployeeData]) -> ()){
        guard let url = URL(string: "https://api-dev-scus-demo.azurewebsites.net/api/Employee/GetEmployee?Department=mobile&UserId=15") else {return}
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if error == nil{
                guard let data = data else {return}
                do{
                let employeeResult = try JSONDecoder().decode(Employee.self, from: data)
                    //print(employeeResult.data)
                    completionHandler(employeeResult.data)
                } catch {
                    print(error.localizedDescription)
                }

            }
        }
        task.resume()
    }
}
