//
//  UICollectionView+Extension.swift
//  BaseSwift
//
//  Created by nava on 7/13/18.
//  Copyright © 2018 nava. All rights reserved.
//

import UIKit


extension UICollectionView{
    
    func register<T:UICollectionViewCell> (_: T.Type) where T:ReusableView, T:NibLoadableView{
        let nib = UINib(nibName: T.NibName, bundle: nil)
        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell <T: UICollectionViewCell>(forIndexPath indexPath:IndexPath) -> T where T:ReusableView {
        
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else{
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        
        return cell
        
    }
    
}

//extension UICollectionViewCell:ReusableView,NibLoadableView{

//}

extension UICollectionReusableView:ReusableView,NibLoadableView{
    
}

