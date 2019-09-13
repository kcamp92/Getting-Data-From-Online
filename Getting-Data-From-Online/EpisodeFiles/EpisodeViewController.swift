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
    
    var infoHolder: Shows!
    
    var episodeList = [EpisodeWrapper]() {
        didSet{
            EpisodesTableView.reloadData()
        }
    }
    
    private func loadData(episodeInfo: Int) {
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
        if let cell = EpisodesTableView.dequeueReusableCell(withIdentifier: "EpisodeCell", for: indexPath) as? EpisodeTableViewCell {
            let episode = episodeList[indexPath.row]
            cell.NameLabel.text = episode.name
            cell.EpisodeInfoLabel.text = episode.lazyWayOut()
            
            if let image = episode.image {
                ImageHelper.shared.getImage(urlString: image.original)
                {(result) in
                    DispatchQueue.main.async {
                        switch result {
                        case .failure(let error):
                            print(error)
                        case .success(let imageFromOnline):
                            cell.EpisodeImage.image = imageFromOnline
                        }
                    }
                }
            } else {
                cell.EpisodeImage.image = UIImage(named: "xSpot")
            }
            return cell
            
        } else {
            
            return UITableViewCell()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EpisodesTableView.dataSource = self
        EpisodesTableView.delegate = self
        loadData(episodeInfo: infoHolder.id)
    }
}

extension EpisodeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = storyboard?.instantiateViewController(withIdentifier:"EpisodeDetailViewController") as! EpisodeDetailViewController
        storyBoard.episodeHolder = episodeList[indexPath.row]
        
        navigationController?.pushViewController(storyBoard, animated: true)
    }
}

