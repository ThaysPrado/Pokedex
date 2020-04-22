//
//  PokemonItemTests.swift
//  PokedexTests
//
//  Created by Thays Prado on 21/04/20.
//  Copyright © 2020 ThaysPrado. All rights reserved.
//

import Quick
import Nimble
@testable import Pokedex

class PokemonItemTests: QuickSpec {
    override func spec() {
        var sut: [PokemonItem]!
        
        describe("The PokemonItem") {
            context("Can be created with valid JSON") {
                afterEach {
                    sut = nil
                }
                beforeEach {
                    if let path = Bundle(for: type(of: self)
                    ).path(forResource: "PokemonList", ofType: "json") {
                        do {
                            let response = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                            let decoded = try JSONSerialization.jsonObject(with: response, options: [])
                            if let dictFromJSON = decoded as? [String: Any] {
                                if let pokemonList = dictFromJSON["results"] as? [[String: Any]] {
                                    sut = PokemonItem.getModels(pokemonList)
                                }
                            }
                        } catch {
                            fail("Problem parsing JSON")
                        }
                    }
                }
                it("is an array with in 20 elements") {
                    expect(sut.count).to(equal(20))
                }
                it("first element have a name - bulbasaur") {
                    expect(sut[0].name).to(equal("bulbasaur"))
                }
            }
        }
    }
}
