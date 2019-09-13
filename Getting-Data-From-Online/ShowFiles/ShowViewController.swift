//
//  ViewController.swift
//  Getting-Data-From-Online
//
//  Created by Krystal Campbell on 9/11/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var ShowTableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var showList = [ShowWrapper]() {
        didSet{
            ShowTableView.reloadData()
        }
    }
    
    var userSearchedText: String? {
        didSet {
            self.ShowTableView.reloadData()
        }
    }
    
    var filteredShows: [ShowWrapper] {
        guard let searchedText = userSearchedText else {
            return showList
        }
        if searchedText == "" {
            return showList
        }
        return showList
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        userSearchedText = searchBar.text
        loadData(showInfo: searchBar.text)
    }
    
    
    private func loadData(showInfo: String?) {
        ShowsAPIManager.shared.getShows(showTitle:showInfo){(result)in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case . success(let showsFromOnline): self.showList = showsFromOnline
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredShows.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = ShowTableView.dequeueReusableCell(withIdentifier: "ShowCell", for: indexPath) as? ShowsTableViewCell {
            let show = filteredShows[indexPath.row]
            cell.NameLabel.text = show.show.name
          
            cell.RatingsLabel.text = show.show.rating.average?.description
            if let image = show.show.image {
                ImageHelper.shared.getImage(urlString: image.original)
                {(result) in
                    DispatchQueue.main.async {
                        switch result {
                        case .failure(let error):
                            print(error)
                        case .success(let imageFromOnline):
                            cell.imageOutlet.image = imageFromOnline
                        }
                    }
                }
            } else {
                cell.imageOutlet.image = UIImage(named: "xSpot")
            }
            return cell
            
        } else {
            
            return UITableViewCell()
        }
    }

override func viewDidLoad() {
    super.viewDidLoad()
    ShowTableView.dataSource = self
    ShowTableView.delegate = self
    searchBar.delegate = self
    }
}


extension ShowViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = storyboard?.instantiateViewController(withIdentifier:"EpisodeViewController") as! EpisodeViewController
       storyBoard.infoHolder = filteredShows[indexPath.row].show
        
        navigationController?.pushViewController(storyBoard, animated: true)
        
    }
}
