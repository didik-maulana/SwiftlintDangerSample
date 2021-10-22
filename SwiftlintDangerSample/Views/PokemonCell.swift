//
//  PokemonCell.swift
//  SwiftlintDangerSample
//
//  Created by Didik on 22/10/21.
//

import UIKit

class PokemonCell: UITableViewCell {
  
  @IBOutlet weak var thumbnailBackgroundView: UIView!
  @IBOutlet weak var thumbnailImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var typeLabel: UILabel!
  
  static let identifier = "PokemonCell"
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  func bind(pokemon: Pokemon) {
    switch pokemon.type {
    case .attacker:
      thumbnailBackgroundView.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.6941176471, blue: 0.6274509804, alpha: 1)
    case .speedster:
      thumbnailBackgroundView.backgroundColor = #colorLiteral(red: 0.4549019608, green: 0.7254901961, blue: 1, alpha: 1)
    case .all_rounder:
      thumbnailBackgroundView.backgroundColor = #colorLiteral(red: 0.6352941176, green: 0.6078431373, blue: 0.9960784314, alpha: 1)
    case .defender:
      thumbnailBackgroundView.backgroundColor = #colorLiteral(red: 0.3333333333, green: 0.937254902, blue: 0.768627451, alpha: 1)
    case .supporter:
      thumbnailBackgroundView.backgroundColor = #colorLiteral(red: 1, green: 0.9176470588, blue: 0.6549019608, alpha: 1)
    }
    thumbnailBackgroundView.layer.cornerRadius = 10
    thumbnailImageView.image = UIImage(named: pokemon.imageName)
    nameLabel.text = pokemon.name
    typeLabel.text = pokemon.skills
  }
}
