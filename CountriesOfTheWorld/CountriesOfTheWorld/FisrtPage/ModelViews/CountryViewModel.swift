//
//  CountryViewModel.swift
//  CountriesOfTheWorld
//
//  Created by Default on 24.04.24.
//

import UIKit

class CountryViewModel {

    public var countries: [CountryModel] = []
    
    func fetchData(completion: @escaping () -> Void) {
            let url = URL(string: "https://restcountries.com/v3.1/all")!
            URLSession.shared.fetchData(at: url) { result in
                switch result {
                case .success(let country):
                    self.countries = country
                    completion()
                case .failure(let error):
                    print("Ohno, an error, let's handle it \(error)")
                }
            }
        }
    func getData() -> [CountryModel] {
        return countries
    }
}
