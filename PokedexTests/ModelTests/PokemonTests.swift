//
//  PokemonTests.swift
//  PokedexTests
//
//  Created by Thays Prado on 22/04/20.
//  Copyright © 2020 ThaysPrado. All rights reserved.
//

import Quick
import Nimble
@testable import Pokedex

class PokemonTests: QuickSpec {
    override func spec() {
        var sut: Pokemon!
        
        describe("The Pokemon") {
            context("Can be created with valid JSON") {
                afterEach {
                    sut = nil
                }
                beforeEach {
                    if let path = Bundle(for: type(of: self)).path(forResource: "PokemonList", ofType: "json") {
                        do {
                            let response = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                            let decoded = try JSONSerialization.jsonObject(with: response, options: [])
                            if let dictFromJSON = decoded as? [String: Any] {
                                sut = Pokemon.getModels([dictFromJSON])[0]
                            }
                        } catch {
                        fail("Problem parsing JSON")
                        }
                    }
                }
                it("first ability is chlorophyll") {
                    expect(sut.abilities[0]).to(equal("chlorophyll"))
                }
                it("first type is poison") {
                    expect(sut.types[0]).to(equal("poison"))
                }
                it("your name is bulbasaur") {
                    expect(sut.name).to(equal("bulbasaur"))
                }
            }
        }
    }
}
