//
//  EpisodeDetailViewController.swift
//  Getting-Data-From-Online
//
//  Created by Krystal Campbell on 9/12/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {
    
    var episodeHolder: EpisodeWrapper!
    
    @IBOutlet weak var Image: UIImageView!
    
    @IBOutlet weak var episodeName: UILabel!
    
    @IBOutlet weak var episodeInformation: UILabel!
    
    @IBOutlet weak var episodeDescription: UITextView!
    
    func setUpLabels() {
        episodeName.text = episodeHolder.name
        episodeInformation.text = "Season:\(episodeHolder.season)\(episodeHolder.number)"
        episodeDescription.text = episodeHolder.summary
    }
    
    func loadImage() {
        ImageHelper.shared.getImage(urlString: episodeHolder.image!.original) {(result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let imageFromOnline):
                    self.Image.image = imageFromOnline
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabels()
        loadImage()

        // Do any additional setup after loading the view.
    }
    
}
