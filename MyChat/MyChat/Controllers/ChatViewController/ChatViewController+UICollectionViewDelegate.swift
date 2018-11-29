//
//  ChatViewController+UICollectionViewDelegate.swift
//  MyChat
//
//  Created by Dmitriy Tarelkin on 24/11/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//



import UIKit



extension ChatViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var reuseIdentifier:String
        
        if self.dataSource[indexPath.row].messageType == .MessageFromCurentUser {
            reuseIdentifier = kCurrentUserCellIdentifier
        } else {
            reuseIdentifier = kOtherUserCellIdentifier
        }
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? UserChatCollectionViewCell else {
            return UserChatCollectionViewCell()
        }
        
        cell.configureCellWithUser(message: self.dataSource[indexPath.row])
      
        return cell
    }
    
    
    
    
    //message height
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.bounds.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
}
