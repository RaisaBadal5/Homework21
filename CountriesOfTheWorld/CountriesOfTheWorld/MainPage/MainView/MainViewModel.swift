//
//  MainViewModel.swift
//  CountriesOfTheWorld
//
//  Created by Default on 27.04.24.
//

import Foundation

class MainViewModel {
    private var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func checkFirstTimeLogin(completion: @escaping (Bool) -> Void) {
        let isFirstTimeLogin = !UserDefaults.standard.bool(forKey: "FirstTimeLogin")
        completion(isFirstTimeLogin)
    }
    
    func authenticateUser(completion: @escaping (Bool, String?) -> Void) {
        UserDefaults.standard.set(user.username, forKey: "Username")
        completion(true, "Username saved successfully!")
    }
}
