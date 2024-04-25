//
//  DetailPageViewModel.swift
//  CountriesOfTheWorld
//
//  Created by Default on 25.04.24.
//

import UIKit

class DetailPageViewModel {

    let countryViewModel: CountryViewModel = CountryViewModel()
       
       func getDetailOfCountry(name: String) -> CountryModel? {
           return countryViewModel.countries.first(where: { $0.name?.common == name })
       }
}
