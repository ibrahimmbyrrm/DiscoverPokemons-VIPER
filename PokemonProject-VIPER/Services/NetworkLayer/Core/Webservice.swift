//
//  Webservice.swift
//  PokemonProject-VIPER
//
//  Created by İbrahim Bayram on 16.06.2023.
//

import Foundation
import Alamofire

class Webservice{
    let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0")
    func callApi<T : Codable>(resource : Resource<T>,completion : @escaping(Result<T,Error>)->Void) {
        AF.request(resource.url).response { response in
            switch response.result {
            case .success(let data):
                guard let data = data else {return}
                let decodedData = try? JSONDecoder().decode(T.self, from: data)
                guard let decodedData = decodedData else {return}
                completion(.success(decodedData))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(httpError.invalidData))
            }
        }
        
    }
}
