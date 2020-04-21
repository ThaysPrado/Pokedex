//
//  PokemonTarget.swift
//  Pokedex
//
//  Created by Thays Prado on 20/04/20.
//  Copyright © 2020 ThaysPrado. All rights reserved.
//

import Moya

enum PokemonTarget {
    case searchPokemon(name: String?)
    case listPokemon(offset: String?)
    case fetchPokemon(name: String?)
    case loadImage
}

extension PokemonTarget: TargetType {

    var baseURL: URL {
        switch self {
        case .fetchPokemon,
             .listPokemon,
             .searchPokemon:
            return NetworkConstants.URLs.baseURL
        case .loadImage:
            return NetworkConstants.URLs.imageURL
        }
    }
    
    var path: String {
        switch self {
        case .searchPokemon(let name),
             .fetchPokemon(let name):
            return "/\(name ?? "missigno")/"
        default:
            return ""
        }
    }
    
    var method: Method {
        switch self {
        case .fetchPokemon,
             .loadImage,
             .listPokemon,
             .searchPokemon:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .fetchPokemon,
             .loadImage,
             .searchPokemon:
            return .requestPlain
        case .listPokemon(let offset):
            var params: [String: Any] = [:]
            params["offset"] = offset
            params["limit"] = "20"
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return NetworkConstants.Headers.contentTypeApplicationJSON
    }
    
    var validationType: ValidationType {
        return ValidationType.successCodes
    }
    
//    requestPlain: Usado para requests que não requer passar nenhum tipo de dado. Como por exemplo um simples “get”;
//    requestData: Usado quando a request espera que um objeto do tipo “data” seja passado no body da request;
//    requestJSONEncodable: Usado quando a request espera um objeto JSON encodable;
//    requestParameters: Usado quando queremos passar os parâmetros e definir o nosso próprio tipo de encoding
//    requestCompositeData: Usado quando você quer passar um objeto do tipo data como body da request e também informar os parâmetros da URL;
//    requestCompositeParamers: Igual o requestCompositeData mas passando parâmetros no body ao invés de um objeto do tipo “data”;
//    downloadParameters: Usado para baixar algum aquivo e passar parâmetros se necessário;
//    uploadCompositeMultipart: Usado para passar dados tipo multipart com parâmetros
    
}
