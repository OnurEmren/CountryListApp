//
//  MyTableViewCell.swift
//  CountryListApp
//
//  Created by Severus Snape on 16.03.2023.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    
    
    func configure(with imageArray: ImageArray) {
          myImageView?.image = UIImage(named: imageArray.imageName)
          myLabel?.text = imageArray.title
      }
    
}
