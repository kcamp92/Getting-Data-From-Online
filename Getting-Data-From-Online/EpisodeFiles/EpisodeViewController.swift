//
//  EpisodeViewController.swift
//  Getting-Data-From-Online
//
//  Created by Krystal Campbell on 9/12/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class EpisodeViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var EpisodesTableView: UITableView!
    
    var episodeList = [EpisodeWrapper]() {
        didSet{
            EpisodesTableView.reloadData()
        }
    }
    private func loadData(episodeInfo: Int?) {
        EpisodesAPIManager.shared.getEpisodes(episodeTitle:episodeInfo){(result)in DispatchQueue.main.async {
            switch result {
            case .failure(let error):
                print(error)
            case .success(let episodesFromOnline): self.episodeList = episodesFromOnline
                }
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
}



}
