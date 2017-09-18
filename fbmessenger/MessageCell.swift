//
//  MessageCell.swift
//  fbmessenger
//
//  Created by 楷岷 張 on 2017/8/5.
//  Copyright © 2017年 楷岷 張. All rights reserved.
//

import UIKit
import SDWebImage

class MessageCell: BaseCell {
    
    var message: Message? {
        didSet {
            if let photo = message?.friend?.photo {
                profileImageView.sd_setImage(with: URL(string: photo), placeholderImage: nil)
                // TODO
                hasReadImageView.sd_setImage(with: URL(string: photo), placeholderImage: nil)
            }
            nameLabel.text = message?.friend?.name
            messageLabel.text = message?.message
            if let date = message?.date {
                timeLabel.text = FBMessageStyle.dateToString(date: date)
            }
        }
    }
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "userPhoto")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 34.0
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var bottomLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return view
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Friend Name"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.text = "Your Friend's message and something else..."
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "12:05 PM"
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    lazy var hasReadImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10.0
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "userPhoto")
        return imageView
    }()
    
    override func setupViews() {
        //        super.setupViews()
        
        addSubview(profileImageView)
        addSubview(bottomLineView)
        
        setContainerView()
        
        addConstraintsWithFormat(format: "H:|-12-[v0(68)]", views: profileImageView)
        addConstraintsWithFormat(format: "V:[v0(68)]", views: profileImageView)
        
        NSLayoutConstraint(item: profileImageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0).isActive = true
        
        addConstraintsWithFormat(format: "H:|-82-[v0]|", views: bottomLineView)
        addConstraintsWithFormat(format: "V:[v0(1)]|", views: bottomLineView)
        
    }
    
    private func setContainerView() {
        addSubview(containerView)
        
        addConstraintsWithFormat(format: "H:|-90-[v0]|", views: containerView)
        addConstraintsWithFormat(format: "V:[v0(50)]", views: containerView)
        NSLayoutConstraint(item: containerView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0).isActive = true
        
        containerView.addSubview(nameLabel)
        containerView.addSubview(messageLabel)
        containerView.addSubview(timeLabel)
        containerView.addSubview(hasReadImageView)
        
        containerView.addConstraintsWithFormat(format: "H:|[v0][v1(80)]-12-|", views: nameLabel, timeLabel)
        containerView.addConstraintsWithFormat(format: "V:|[v0(24)]|", views: timeLabel)
        containerView.addConstraintsWithFormat(format: "H:|[v0]-8-[v1(20)]-12-|", views: messageLabel, hasReadImageView)
        containerView.addConstraintsWithFormat(format: "V:[v0(20)]|", views: hasReadImageView)
        containerView.addConstraintsWithFormat(format: "V:|[v0][v1(24)]|", views: nameLabel, messageLabel)
    }
}


class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = .blue
    }
}

