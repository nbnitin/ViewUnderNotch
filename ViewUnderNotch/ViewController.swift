//
//  ViewController.swift
//  ViewUnderNotch
//
//  Created by Nitin Bhatia on 31/08/22.
//

import UIKit

extension UIApplication {
    
    static var topWindow: UIWindow {
        
        if #available(iOS 15.0, *) {
            let scenes = UIApplication.shared.connectedScenes
            let windowScene = scenes.first as? UIWindowScene
            return windowScene!.windows.first!
        }
        return UIApplication.shared.windows.filter { $0.isKeyWindow }.first!
    }
    
}

class ViewController: UIViewController {
    @IBOutlet weak var lblTitleUnderNotch: UILabel!
    
    var notchView: UIView {
            let notchLabel = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 34.0))
            notchLabel.text = "Any text you want"
            notchLabel.backgroundColor = .clear
            notchLabel.textAlignment = .center
            notchLabel.textColor = .black
            notchLabel.layer.zPosition = CGFloat(Float.greatestFiniteMagnitude)
            return notchLabel
        }
        
        var isNotchViewNeeded: Bool {
            UIApplication.topWindow.safeAreaInsets.top >= 44
    //        &&
    //        Environments.shared.environment != .prod
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblTitleUnderNotch.text = "Hello There!"
        configureNotchView()
    }

    func configureNotchView() {
            if isNotchViewNeeded {
                UIApplication.topWindow.addSubview(notchView)
            }
        }

}

