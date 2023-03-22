//
//  Custom.swift
//  Pokeapp
//
//  Created by Hüseyin BAKAR on 22.03.2023.
//

import UIKit

public class Utils {
    class func animate(_ cell:UITableViewCell,_ indexPath:IndexPath)
        {
            let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 50, 0)
            cell.layer.transform = rotationTransform
            cell.alpha = 0
            UIView.animate(withDuration: 0.75) {
                cell.layer.transform = CATransform3DIdentity
                cell.alpha = 1.0
            }
        }
}
