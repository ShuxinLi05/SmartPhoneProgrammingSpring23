//
//  ViewController.swift
//  AppForRestaurants
//
//  Created by shuxin on 2/15/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var selectedRestaurant: String?
    var selectedFoods: [String] = []
    
    let restaurants = ["Mbar","Teinei", "Taku", "Bentoful"]
    let foods = ["Mbar": ["Soft Drinks","Salads", "Steak"],
                 "Teinei": ["Poke Bowl","Shoyu Ramen", "Tan Tan Men"],
                 "Taku": ["Karaage","Edamame", "Mushroom Bowl"],
                 "Bentoful": ["Kale Salad","Fried Rice", "Chicken Curry"]]

    @IBOutlet weak var tblViewTop: UITableView!
    @IBOutlet weak var tblViewBottom: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblViewTop.dataSource = self
        tblViewTop.delegate = self
        tblViewBottom.dataSource = self
        tblViewBottom.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tblViewTop{
            return restaurants.count
        } else if tableView == tblViewBottom{
            return selectedFoods.count
        }else{
            return 0
        }
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if tableView == tblViewTop {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                cell.textLabel?.text = restaurants[indexPath.row]
                return cell
            } else if tableView == tblViewBottom {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                cell.textLabel?.text = selectedFoods[indexPath.row]
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                return cell
            }
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if tableView == tblViewTop {
                // Get the selected restaurant name
                let selectedRestaurant = restaurants[indexPath.row]
                
                // Filter the foods array to get the items for the selected restaurant
                if let foodsForSelectedRestaurant = foods[selectedRestaurant] {
                    selectedFoods = foodsForSelectedRestaurant
                } else {
                    selectedFoods = []
                }
                
                // Reload the bottom table view
                tblViewBottom.reloadData()
            }
        }


}

