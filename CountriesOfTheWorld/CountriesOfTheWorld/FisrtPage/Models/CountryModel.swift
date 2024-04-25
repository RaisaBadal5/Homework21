//
//  CountryModel.swift
//  CountriesOfTheWorld
//
//  Created by Default on 24.04.24.
//

import UIKit

struct CountryModel: Decodable {
    let name: Name?
    let flag: String?
    let flags: Flags?
    let capital: [String]?
    let region: String?
    let borders: [String]?
    let altSpellings: [String]?
    
    enum CodingKeys: String, CodingKey {
        case name
        case flag
        case flags
        case capital
        case region
        case borders
        case altSpellings
    }
}

struct Name: Decodable {
    let common: String?
    let nativeName: NativeName?
    
    enum CodingKeys: String, CodingKey {
        case common
        case nativeName
    }
}

struct NativeName: Decodable {
    let common: String?
    
    enum CodingKeys: String, CodingKey {
        case common
    }
}

struct Flags: Decodable {
    let alt: String?
    let png: URL?
    enum CodingKeys: String, CodingKey {
        case alt
        case png
    }
}

extension URLSession {
  func fetchData(at url: URL, completion: @escaping (Result<[CountryModel], Error>) -> Void) {
    self.dataTask(with: url) { (data, response, error) in
      if let error = error {
        completion(.failure(error))
      }

      if let data = data {
        do {
          let toDos = try JSONDecoder().decode([CountryModel].self, from: data)
          completion(.success(toDos))
        } catch let decoderError {
          completion(.failure(decoderError))
        }
      }
    }.resume()
  }
}
