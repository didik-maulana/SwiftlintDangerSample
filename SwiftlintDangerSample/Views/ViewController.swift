//
//  ViewController.swift
//  SwiftlintDangerSample
//
//  Created by Didik on 18/10/21.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var pokemonsTableView: UITableView!
  
  private let pokemons: [Pokemon] = AllPokemon().data.shuffled()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    pokemonsTableView.delegate = self
    pokemonsTableView.dataSource = self
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return pokemons.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: PokemonCell.identifier, for: indexPath) as? PokemonCell else {
      fatalError("Unable to dequeue \(PokemonCell.identifier)")
    }
    cell.bind(pokemon: pokemons[indexPath.row])
    return cell
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
