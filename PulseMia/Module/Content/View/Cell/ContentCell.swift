//
//  ContentCell.swift
//  PulseMia
//
//  Created by Gokhan Isiker on 01/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import UIKit

class ContentCell: UICollectionViewCell {

    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subtitleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 8.0
        clipsToBounds = true
    }
    
    func setup(with content: Content) {
        titleLabel.text = content.title
        posterImageView.setImage(with: content.getPosterUrl())
        subtitleLabel.text = content.subtitle
        dateLabel.text = content.date
    }
    
    override func prepareForReuse() {
        print("prepare for reuse for contentCell")
    }
    
}
