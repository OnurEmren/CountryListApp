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
        
        title = imageArray.title.uppercased()
        
        detailImageView.image = UIImage(named: imageArray.imageName)
        //detailNameLabel.text = imageArray.title.uppercased()
        detailImageView.layer.borderWidth = 2
        navigationItem.largeTitleDisplayMode = .never
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        
    }
    
    @objc func shareTapped(){
        
        guard let image = detailImageView.image?.jpegData(compressionQuality: 0.8)
        else {
            print("No items")
            
            return
        }
        
        
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
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
