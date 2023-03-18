//
//  ViewController.swift
//  CountryListApp
//
//  Created by Severus Snape on 15.03.2023.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var listTableView: UITableView!
    
    
    let imageArray = [ImageArray(title: "estonia", imageName: "estonia"),
                      ImageArray(title: "france", imageName: "france"),
                      ImageArray(title: "germany", imageName: "germany"),
                      ImageArray(title: "ireland", imageName: "ireland"),
                      ImageArray(title: "italy", imageName: "italy"),
                      ImageArray(title: "monaco", imageName: "monaco"),
                      ImageArray(title: "nigeria", imageName: "nigeria"),
                      ImageArray(title: "poland", imageName: "poland"),
                      ImageArray(title: "russia", imageName: "russia"),
                      ImageArray(title: "spain", imageName: "spain"),
                      ImageArray(title: "uk", imageName: "uk"),
                      ImageArray(title: "us", imageName: "us"),
    ]
    
    
    private var countriesImage = [UIImage(named: "estonia"),
                                  UIImage(named: "france"),
                                  UIImage(named: "germany"),
                                  UIImage(named: "ireland"),
                                  UIImage(named: "italy"),
                                  UIImage(named: "monaco"),
                                  UIImage(named: "nigeria"),
                                  UIImage(named:"poland"),
                                  UIImage(named: "russia"),
                                  UIImage(named: "spain"),
                                  UIImage(named: "uk"),
                                  UIImage(named: "us"),
                                  
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        title = "Countries"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        
        listTableView.reloadData()
        
        listTableView.register(MyTableViewCell.self, forCellReuseIdentifier: "MyCell")
        listTableView.delegate = self
        listTableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyTableViewCell
       
        let countryName = imageArray[indexPath.row].title
        let flagImage = countriesImage[indexPath.row]
      
        cell.imageView?.image = flagImage
        cell.textLabel?.text = countryName.uppercased()
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50 // hücre yüksekliği
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10 // üstteki boşluğun yüksekliği
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10 // alttaki boşluğun yüksekliği
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let myList = imageArray[indexPath.row]
        performSegue(withIdentifier: "goToDetail", sender: myList)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetail", let imageArray = sender as? ImageArray{
            let detailVC = segue.destination as! DetailViewController
            detailVC.imageArray = imageArray
        }
    }
    
}

