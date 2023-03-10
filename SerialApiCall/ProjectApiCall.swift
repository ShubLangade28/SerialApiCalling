//
//  ProjectApiCall.swift
//  SerialApiCall
//
//  Created by shubhan.langade on 18/02/23.
//

import Foundation
class ProjectApiCall{
    func getProjectData(completionHandler : @escaping ([Project])->()){
        guard let url = URL(string: "https://api-dev-scus-demo.azurewebsites.net/api/Project/GetProjects") else {return}
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if error == nil{
                guard let data = data else {return}
                do{
                let projectResult = try JSONDecoder().decode([Project].self, from: data)
                    //print(projectResult)
                    completionHandler(projectResult)
                } catch {
                    print(error.localizedDescription)
                }

            }
        }
        task.resume()
    }
}
