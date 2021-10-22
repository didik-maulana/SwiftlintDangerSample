//
//  PokemonTest.swift
//  SwiftlintDangerSampleTests
//
//  Created by Didik on 22/10/21.
//

import XCTest
@testable import SwiftlintDangerSample

class PokemonTest: XCTestCase {
  
  private let pokemonName: String = "Sylveon"
  private let pokemonType: PokemonType = .attacker
  private let pokemonImageName: String = "sylveon"
  private let pokemonSkills: String = "Attacker, Ranged"
  private var pokemon: Pokemon?
  
  override func setUpWithError() throws {
    pokemon = Pokemon(
      name: pokemonName,
      type: pokemonType,
      imageName: pokemonImageName,
      skills: pokemonSkills
    )
  }
  
  override func tearDownWithError() throws {
    pokemon = nil
  }
  
  func testPokemonShouldBeCorrectValue() throws {
    XCTAssertEqual(pokemon?.name, pokemonName)
    XCTAssertEqual(pokemon?.type, pokemonType)
    XCTAssertEqual(pokemon?.imageName, pokemonImageName)
    XCTAssertEqual(pokemon?.skills, pokemonSkills)
  }
}
