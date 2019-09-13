//
//  EpisodeTableViewCell.swift
//  Getting-Data-From-Online
//
//  Created by Krystal Campbell on 9/12/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {

    @IBOutlet weak var EpisodeImage: UIImageView!
    
    @IBOutlet weak var NameLabel: UILabel!
    
    @IBOutlet weak var EpisodeInfoLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
