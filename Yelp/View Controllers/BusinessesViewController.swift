//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Chau Vo on 10/17/16.
//  Copyright © 2016 CoderSchool. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var searchBar : UISearchBar!
    var businesses: [Business]!
    var searchString: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar = UISearchBar()
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        doSearch()
        /*Business.search(with: "Thai") { (businesses: [Business]?, error: Error?) in
            if let businesses = businesses {
                self.businesses = businesses
                self.tableView.reloadData()
            }
        }*/

        // Example of Yelp search with more search options specified
        /*
        Business.search(with: "Restaurants", sort: .Distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]?, error: Error?) in
            if let businesses = businesses {
                self.businesses = businesses

                for business in businesses {
                    print(business.name!)
                    print(business.address!)
                }
            }
        }
        */
        
            }
    func doSearch() {
        searchString = searchBar.text
        
        Business.search(with: searchString!) { (businesses: [Business]?, error: Error?) in
            if let businesses = businesses {
                self.businesses = businesses
                self.tableView.reloadData()
            }
        }
    }

    override func prepare( for segue: UIStoryboardSegue, sender: Any?) {
        let navController = segue.destination as! UINavigationController
        let filterVC = navController.topViewController as! FiltersViewController
        filterVC.delegate = self
    }
}
extension BusinessesViewController: UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(true, animated: true)
        return true
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(false, animated: true)
        return true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.resignFirstResponder()
        doSearch()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchString = searchBar.text
        searchBar.resignFirstResponder()
        doSearch()
    }
}


extension BusinessesViewController: UITableViewDelegate, UITableViewDataSource, FiltersViewControllerDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if businesses != nil {
            return businesses.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusinessCell") as! BusinessCell
        cell.business = businesses[indexPath.row]
        //cell.nameLabel = businesses[]
        return cell
        
    }
    func filtersViewController(filtersViewController: FiltersViewController, didUpdateFilter filters: [String], didUpdateDeal deal: Bool,didUpdateSort sortValue: String) {
        print("i get the new filters from filterVC")
        print(deal)
        print(sortValue)
        if sortValue == "highestRated" {
            Business.search(with: "Thai", sort: YelpSortMode.highestRated, categories: filters, deals: deal) { (businesses: [Business]?, error: Error?) in
                if let businesses = businesses {
                self.businesses = businesses
                self.tableView.reloadData()
                }
            }
        } else {
            Business.search(with: "Thai", sort: nil, categories: filters, deals: deal) { (businesses: [Business]?, error: Error?) in
                if let businesses = businesses {
                    self.businesses = businesses
                    self.tableView.reloadData()
                }
            }
            
        }
    }
}
