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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}
