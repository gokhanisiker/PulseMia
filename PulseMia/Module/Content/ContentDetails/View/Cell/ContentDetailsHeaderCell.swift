//
//  ContentHeaderCell.swift
//  PulseMia
//
//  Created by Gökhan Işıker on 02/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import UIKit

class ContentDetailsHeaderCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var detailHeaderLabel: UILabel!
    @IBOutlet weak var detailBodyLabel: UILabel!
    @IBOutlet weak var detailDateLabel: UILabel!
    @IBOutlet weak var detailSubtitleLabel: UILabel!
    
    func setup(with contentDetails: ContentDetails) {
        posterImageView.setImage(with: contentDetails.getPosterDetailUrl())
        detailBodyLabel.text = contentDetails.body
        detailHeaderLabel.text = contentDetails.title
        detailDateLabel.text = contentDetails.date
        detailSubtitleLabel.text = contentDetails.subtitle
    }
    
}
