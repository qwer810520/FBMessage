//
//  ViewController.swift
//  fbmessenger
//
//  Created by 楷岷 張 on 2017/7/25.
//  Copyright © 2017年 楷岷 張. All rights reserved.
//

import UIKit


class FriendsController: ParentViewController {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.view.frame.width, height: 100)
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.alwaysBounceVertical = true
        return collectionView
    }()
    
    var messages: [Message]?
    
    func setupData() {
        let mark = Friend()
        mark.name = "はたの ゆい"
        mark.photo = "userPhoto"
        
        let message = Message()
        message.friend = mark
        message.message = "Hello, my name is はたの ゆい, Nice to meet you.."
        message.date = Date().timeIntervalSince1970
        messages = [message]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setUserInterface()
    }
    
    private func setUserInterface() {
        self.navigationItem.title = "Chat List"
        self.view.addSubview(collectionView)
        NSLayoutConstraint(item: collectionView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: collectionView, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: collectionView, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1.0, constant: 0.0).isActive = true
        NSLayoutConstraint(item: collectionView, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0.0).isActive = true
        collectionView.register(MessageCell.self, forCellWithReuseIdentifier: MessageCell.identifier)
        setupData()
    }
    
    private func setCellSize() {
        let latout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        latout.itemSize = CGSize(width: view.frame.width, height: 100)
    }
    
}

extension FriendsController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = messages?.count {
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let messageCell = collectionView.dequeueReusableCell(withReuseIdentifier: MessageCell.identifier, for: indexPath) as! MessageCell
        if let message = messages?[indexPath.item] {
            messageCell.message = message
        }
        return messageCell
    }
}


