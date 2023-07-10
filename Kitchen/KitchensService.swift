//
//  KitchensService.swift
//  Kitchen
//
//  Created by Yaroslav Savin on 04.07.2023.
//

import Foundation

let urlD = "https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54"

func decode<T: Decodable>(url:String, struct: T.Type) -> T {
    guard let urlD = URL(string: url) else {
    fatalError("Could not URL")
        
    }
    guard let data = try? Data(contentsOf: urlD) else {
        fatalError("problems with Data")
    }
    let decoder = JSONDecoder()
    guard let loadedData = try? decoder.decode(T.self, from: data) else {
        fatalError("cannot loadedData")
    }
    return loadedData
}
