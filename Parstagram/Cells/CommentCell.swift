//
//  CommentCell.swift
//  Parstagram
//
//  Created by Atef Kai Benothman on 5/18/19.
//  Copyright © 2019 Atef Kai Benothman. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell
{
    // Outlets
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }

}
