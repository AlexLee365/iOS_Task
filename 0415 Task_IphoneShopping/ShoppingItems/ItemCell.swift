//
//  ItemCell.swift
//  ShoppingItems
//
//  Created by giftbot on 2019. 4. 10..
//  Copyright © 2019년 giftbot. All rights reserved.
//

import UIKit

protocol ItemCellDelegate : class {
    func passSelf(itemCell : ItemCell)
}


final class ItemCell: UITableViewCell {
    
    weak var delegate : ItemCellDelegate?
    
    let imageView2 = UIImageView()
    let titleLabel = UILabel()
    let countLabel = UILabel()
    let plusButton = UIButton(type: .contactAdd)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(imageView2)
        contentView.addSubview(countLabel)
        contentView.addSubview(plusButton)
        
        plusButton.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView2.frame = CGRect(x: 0, y: 0, width: 90, height: contentView.frame.height)
        imageView2.contentMode = .scaleAspectFit
        titleLabel.frame = CGRect(x: imageView2.frame.origin.x+100, y: contentView.frame.height/2-15, width: 100, height: 30)
        countLabel.frame = CGRect(x: contentView.frame.maxX-70, y: contentView.frame.height/2-15, width: 30, height: 30)
        plusButton.frame = CGRect(x: countLabel.frame.origin.x + 15, y: contentView.frame.height/2-20, width: 40, height: 40)
    }
    
    @objc func didTapButton(_ sender : UIButton) {
        delegate?.passSelf(itemCell: self)
    }
    
    
  
  
}
