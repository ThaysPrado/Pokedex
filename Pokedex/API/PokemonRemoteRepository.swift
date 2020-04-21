//
//  PokemonRemoteRepository.swift
//  Pokedex
//
//  Created by Webeleven on 21/04/20.
//  Copyright © 2020 ThaysPrado. All rights reserved.
//

import Moya
import Foundation
import SwiftyJSON

struct PokemonRemoteRepository: PokemonRepository {
  
    var provider = MoyaProvider<PokemonTarget>()
    
    func listPokemon(offset: String = "0",
                     onSuccess successCallback: ((_ response: [PokemonItem]) -> Void)?,
                     onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        
         provider.request(.listPokemon(offset: offset)) { (result) in
            switch result {
            case .success(let response):
                do {
                    let decoded = try JSONSerialization.jsonObject(with: response.data, options: [])
                    if let dictFromJSON = decoded as? [String: Any] {
                        var data = [PokemonItem]()
                        if let pokemonList = dictFromJSON["results"] as? [[String: Any]] {
                            data = PokemonItem.getModels(pokemonList)
                        }
                        successCallback?(data)
                    }
                } catch {
                  failureCallback?("Not decodable")
                }
            case let .failure(error):
                failureCallback?(error.errorDescription ?? "Error")
            }
        }
    }
    
    public func searchPokemon(name: String,
                              onSuccess successCallback: ((_ response: PokemonItemFound) -> Void)?,
                              onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
    
        provider.request(.searchPokemon(name: name)) { (result) in
            switch result {
            case .success(let response):
                do {
                    let decoded = try JSONSerialization.jsonObject(with: response.data, options: [])
                    if let dictFromJSON = decoded as? [String: Any] {
                        var data = PokemonItemFound()
                        data = PokemonItemFound.getModels(dictFromJSON)
                        successCallback?(data)
                    }
                } catch {
                  failureCallback?("Not decodable")
                }
            case let .failure(error):
                failureCallback?(error.errorDescription ?? "Error")
            }
        }
    }
    
    public func fetchPokemon(name: String,
                             onSuccess successCallback: ((_ response: Pokemon) -> Void)?,
                             onFailure failureCallback: ((_ errorMessage: String) -> Void)?) {
        
        provider.request(.fetchPokemon(name: name)) { (result) in
            switch result {
            case .success(let response):
                do {
                    let decoded = try JSONSerialization.jsonObject(with: response.data, options: [])
                    if let dictFromJSON = decoded as? [String: Any] {
                        var data = [Pokemon]()
                        data = Pokemon.getModels([dictFromJSON])
                        successCallback?(data[0])
                    }
                } catch {
                  failureCallback?("Not decodable")
                }
            case let .failure(error):
                failureCallback?(error.errorDescription ?? "Error")
            }
        }
    }
}

