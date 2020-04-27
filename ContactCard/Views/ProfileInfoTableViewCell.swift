//
//  ProfileInfoTableViewCell.swift
//  ContactCard
//
//  Created by Michael Bullock on 27/04/2020.
//  Copyright © 2020 Michael Bullock. All rights reserved.
//

import UIKit

class ProfileInfoTableViewCell: UITableViewCell {
    
    //    override func awakeFromNib() {
    //        super.awakeFromNib()
    //        // Initialization code
    //    }
    //
    //    override func setSelected(_ selected: Bool, animated: Bool) {
    //        super.setSelected(selected, animated: animated)
    //
    //        // Configure the view for the selected state
    //    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title"
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Description"
        label.textColor = .gray
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        
        let titleInsets = UIEdgeInsets.init(top: 16, left: 16, bottom: 0, right: 8)
        titleLabel.autoPinEdgesToSuperviewEdges(with: titleInsets, excludingEdge: .bottom)
    
        let descInsets = UIEdgeInsets.init(top: 0, left: 16, bottom: 4, right: 8)
        descriptionLabel.autoPinEdgesToSuperviewEdges(with: descInsets, excludingEdge: .top)
        descriptionLabel.autoPinEdge(.top, to: .bottom, of: titleLabel, withOffset: 16)
        
        
        super.updateConstraints()
    }
}




