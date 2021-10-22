//
//  AllPokemon.swift
//  SwiftlintDangerSample
//
//  Created by Didik on 22/10/21.
//

struct AllPokemon {
  
  var data: [Pokemon] = []
  
  init() {
    for pokemon in AttackerPokemon.data {
      data.append(pokemon)
    }
    
    for pokemon in SpeedsterPokemon.data {
      data.append(pokemon)
    }
    
    for pokemon in AllRounderPokemon.data {
      data.append(pokemon)
    }
    
    for pokemon in DefenderPokemon.data {
      data.append(pokemon)
    }
    
    for pokemon in SupporterPokemon.data {
      data.append(pokemon)
    }
  }
}
