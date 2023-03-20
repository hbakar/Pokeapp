//
//  UIViewController+Extension.swift
//  Pokeapp
//
//  Created by Hüseyin BAKAR on 20.03.2023.
//

import Foundation
import UIKit


extension UIViewController {
    var labelColor:UIColor {
        if #available(iOS 13.0, *) {
            return .label
        } else
        {
            if #available(iOS 12.0, *) {
                if traitCollection.userInterfaceStyle == .dark {
                    return .white
                } else {
                    return .black
                }
            } else {
                return .black
                // Fallback on earlier versions
            }
            // Fallback on earlier versions
        }
    }

    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func push(_ vc:UIViewController) {
        navigationController?.pushViewController(vc, animated: true)
    }
    func show(_ vc:UIViewController) {
        present(vc, animated:true, completion:nil)
    }
    
      func presentAlert(withTitle title: String, message : String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { action in
            print("You've pressed OK Button")
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
      }
    
    
    func goToVC(_ vc:UIViewController) -> Void
    {
        if navigationController != nil
        {
            navigationController?.pushViewController(vc, animated: true)
        }
        else
        {
            self.present(vc, animated: true)
        }
    }
}

func getStoryBoardViewController(_ storyboard_id:String, _ view_id:String) -> UIViewController {
    let storyBoard : UIStoryboard = UIStoryboard(name: storyboard_id, bundle:nil)
    
    return storyBoard.instantiateViewController(withIdentifier: view_id)
}
