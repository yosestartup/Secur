//
//  AlbumCell.swift
//  SecurePlace2
//
//  Created by Oleksandr Bambulyak on 27/03/2020.
//  Copyright © 2020 Oleksandr Bambulyak. All rights reserved.
//

import Foundation
import UIKit

class AlbumCell: UICollectionViewCell {
    
    private var backgroundImage: UIImageView = UIImageView()
    private var firstTitleLetter: UILabel = UILabel()
    private var lockIcon: UIImageView = UIImageView()
    
    private var albumTitle: UILabel = UILabel()
    private var numberOfItems: UILabel = UILabel()
    
    private var password: String?
    private var isLocked: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.createUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createUI() {
        contentView.layer.masksToBounds = true
        
        addSubview(backgroundImage)
        backgroundImage.addSubview(firstTitleLetter)
        backgroundImage.addSubview(lockIcon)
        addSubview(albumTitle)
        addSubview(numberOfItems)
        
        backgroundImage.layer.cornerRadius = 5.withRatio()
        backgroundImage.layer.masksToBounds = true
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.snp.makeConstraints { (make) in
            make.width.height.equalTo(140.withRatio())
            make.top.equalToSuperview().offset(3.withRatio())
            make.left.right.equalToSuperview()
        }
        
        firstTitleLetter.font = UIFont.systemFont(ofSize: 48.withRatio(), weight: .regular)
        firstTitleLetter.textColor = UIColor.white
        firstTitleLetter.snp.makeConstraints { (make) in
            make.centerY.centerX.equalToSuperview()
        }
        
        lockIcon.image = UIImage(named: "lock")
        lockIcon.contentMode = .scaleAspectFit
        lockIcon.isHidden = true
        lockIcon.snp.makeConstraints { (make) in
            make.width.height.equalTo(28.withRatio())
            make.bottom.equalToSuperview().offset(-9.withRatio())
            make.right.equalToSuperview().offset(-9.withRatio())
        }
        
        albumTitle.numberOfLines = 1
        albumTitle.font = UIFont.systemFont(ofSize: 12.9.withRatio(), weight: .regular)
        albumTitle.snp.makeConstraints { (make) in
            make.top.equalTo(backgroundImage.snp.bottom).offset(4.withRatio())
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        numberOfItems.font = UIFont.systemFont(ofSize: 12.9.withRatio(), weight: .regular)
        numberOfItems.textColor = Colors.lightGrey
        numberOfItems.snp.makeConstraints { (make) in
            make.top.equalTo(albumTitle.snp.bottom).offset(3.withRatio())
            make.bottom.equalToSuperview()
        }
    }
    
    func fill(model: AlbumModel) {
        if let image = model.backgroundImage {
            self.backgroundImage.image = image
            self.firstTitleLetter.isHidden = true
        } else {
            self.backgroundImage.backgroundColor = Colors.generateAlbumBackgroundColor
            self.firstTitleLetter.text = model.albumTitle.first?.uppercased()
        }
        
        if model.isLocked {
            self.lockIcon.isHidden = false
            self.password = model.password
            self.isLocked = true
        }
        
        albumTitle.text = model.albumTitle
        numberOfItems.text = model.numberOfItems
    }
    
}