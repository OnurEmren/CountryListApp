//
//  DetailViewController.swift
//  CountryListApp
//
//  Created by Severus Snape on 16.03.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    var imageArray: ImageArray!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailNameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailImageView.image = UIImage(named: imageArray.imageName)
        detailNameLabel.text = imageArray.title.uppercased()
        detailImageView.layer.borderWidth = 0.5
        navigationItem.largeTitleDisplayMode = .never
        
     
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    
}
