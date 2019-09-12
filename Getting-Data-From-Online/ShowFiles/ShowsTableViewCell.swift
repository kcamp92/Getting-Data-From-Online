//
//  ShowsTableViewCell.swift
//  Getting-Data-From-Online
//
//  Created by Krystal Campbell on 9/12/19.
//  Copyright © 2019 Krystal Campbell. All rights reserved.
//

import UIKit

class ShowsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageOutlet: UIImageView!
    
    @IBOutlet weak var NameLabel: UILabel!
    
    @IBOutlet weak var RatingsLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
