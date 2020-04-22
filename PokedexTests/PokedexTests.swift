//
//  PokedexTests.swift
//  PokedexTests
//
//  Created by Thays Prado on 21/04/20.
//  Copyright © 2020 ThaysPrado. All rights reserved.
//

import Quick
import Nimble
 
@testable import Pokedex
 
class PokedexTests: QuickSpec {
    override func spec() {
        var subject: ViewController!
        
        describe("The ViewController") {
            context("display collectionView"){
                beforeEach {
                    subject = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController
                    _ = subject.view
                    
                    if let path = Bundle(for: type(of: self)).path(forResource: "PokemonList", ofType: "json") {
                        do {
                            let response = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                            let decoded = try JSONSerialization.jsonObject(with: response, options: [])
                            if let dictFromJSON = decoded as? [String: Any] {
                                if let pokemonList = dictFromJSON["results"] as? [[String: Any]] {
                                    let list = PokemonItem.getModels(pokemonList)
                                    for item in list {
                                        subject.viewModel!.items.value.append(item)
                                    }
                                }
                            }
                        } catch {
                            fail("Problem parsing JSON")
                        }
                    }
                }
                
                it("should have 20 pokemons loaded") {
                    expect(subject.collectionView.numberOfItems(inSection: 0)).to(equal(20))
                }
            }
        }
    }
}
