//
//  SyncResource.swift
//  SerialApiCall
//
//  Created by shubhan.langade on 18/02/23.
//

import Foundation

class SyncResource{
    func syncResource(){
        let group = DispatchGroup()
        
        let employeeBlockOperation = BlockOperation()
        
        employeeBlockOperation.addExecutionBlock {
            let employeeApiCall = EmployeeApiCall()
            employeeApiCall.getDataOfEmployee { employess in
                for employeeName in employess{
                    print(employeeName.name)
                }
            }
        }
        let projectBlockOperation = BlockOperation()
        
        projectBlockOperation.addExecutionBlock {
            group.enter()
            let projectApiCall = ProjectApiCall()
            projectApiCall.getProjectData { projects in
                for projectName in projects{
                    print(projectName.name)
                }
                group.leave()
            }
            group.wait()
        }
        
        employeeBlockOperation.addDependency(projectBlockOperation)
        
        let operationQueues = OperationQueue()
        operationQueues.addOperation(employeeBlockOperation)
        operationQueues.addOperation(projectBlockOperation)
    }
}
