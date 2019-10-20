//
//  MainViewModel.swift
//  RxCustomTable
//
//  Created by Ruslan Akberov on 20.10.2019.
//  Copyright © 2019 Ruslan Akberov. All rights reserved.
//

import Foundation
import RxSwift
import RxDataSources

class MainViewModel {
    
    let users1 = [User(firstName: "John", lastName: "Cena", age: 42),
                 User(firstName: "Undertaker", lastName: "", age: 54),
                 User(firstName: "Brock", lastName: "Lesnar", age: 42)]
    let users2 = [User(firstName: "The Rock", lastName: "", age: 47)]
    
    func getUsers() -> Observable<[SectionModel<String, User>]>{
        return Observable.create { observer in
            let sections = [SectionModel(model: "Legends", items: self.users1),SectionModel(model: "Most Famous", items: self.users2)]
            observer.onNext(sections)
            observer.onCompleted()
            return Disposables.create()
        }
        
    }
    
    
}
