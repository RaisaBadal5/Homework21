//
//  ViewController.swift
//  CountriesOfTheWorld
//
//  Created by Default on 24.04.24.
//

import UIKit

class ViewController: UIViewController {
    
    
    let countryTableView = UITableView()
    
    let mainView: UIView = {
        let mn = UIView()
        mn.translatesAutoresizingMaskIntoConstraints = false
        return mn
    }()
    
    let countryViewModel: CountryViewModel = CountryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMainView()
        mainView.addSubview(countryTableView)
        mainView.backgroundColor = UIColor.white
        setUptableView()
        countryTableView.dataSource = self
        countryTableView.delegate = self
        countryTableView.register(CountryCells.self, forCellReuseIdentifier: "contactCell")
        countryViewModel.fetchData {
            DispatchQueue.main.async {
                self.countryTableView.reloadData()
            }
        }
        
        func handleFetchedData() {
            let rs = countryViewModel.getData()
            //print(rs.count)
        }
        
        func setUpMainView() {
            view.addSubview(mainView)
            mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
            mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        }
        func setUptableView() {
            countryTableView.translatesAutoresizingMaskIntoConstraints = false
            countryTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
            countryTableView.leadingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            countryTableView.trailingAnchor.constraint(equalTo:view.safeAreaLayoutGuide.trailingAnchor).isActive = true
            countryTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            countryTableView.isUserInteractionEnabled = true
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryViewModel.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! CountryCells
        let country = countryViewModel.countries[indexPath.row]
        cell.countryLabel.text = country.flag
        cell.nameLabel.text = country.name?.common
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row tapped at index: \(indexPath.row)")
        tableView.deselectRow(at: indexPath, animated: true)
        let name = countryViewModel.countries[indexPath.row].name?.common
        let aboutflag = countryViewModel.countries[indexPath.row].flags?.alt
        let flagUrl = countryViewModel.countries[indexPath.row].flags?.png
        let nativeName = countryViewModel.countries[indexPath.row].name?.nativeName?.common
        let spellingCountry = countryViewModel.countries[indexPath.row].altSpellings
        let capitalOfCountry = countryViewModel.countries[indexPath.row].capital
        let regionOfCountry = countryViewModel.countries[indexPath.row].region
        let neighbors = countryViewModel.countries[indexPath.row].borders
        
        navigationController?.pushViewController(DetailsPageController(name: name, aboutflags: aboutflag, flagUrl: flagUrl, nativeName: nativeName, spellingCountry: spellingCountry, capitalOfCountry: capitalOfCountry, regionOfCountry: regionOfCountry, neighbors:neighbors), animated: false)
    }
}

