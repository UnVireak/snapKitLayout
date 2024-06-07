//
//  CollorViewController.swift
//  snapKitLayout
//
//  Created by unvireak on 5/6/24.
//

import UIKit

class CollorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension UIColor {
    static let darkPurple: UIColor = {
        return UIColor(red: 75/255.0, green: 0/255.0, blue: 130/255.0, alpha: 1.0)
    }()
    
    static let textFieldCollor:  UIColor = {
        return UIColor(red: 43/255.0, green: 42/255.0, blue: 60/255.0, alpha: 1.0)
    }()
//    static let lightBle: UIColor = {
//        return UIColor(red: 0.8, green: 0.85, blue: 1.0, alpha: 1)
//    }()
}
