//
//  ViewController.swift
//  MenuDrawer
//
//  Created by Armand Casells on 5/10/23.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var openMenuButton: UIButton!
    
    var isMenuOpen = false

    override func viewDidLoad() {
        super.viewDidLoad()
        menuView.frame.origin.x = -menuView.frame.size.width
    }

    @IBAction func toggleMenu(_ sender: Any) {
        if isMenuOpen {
            // Cierra el menú
            UIView.animate(withDuration: 0.3) {
                self.menuView.frame.origin.x = -self.menuView.frame.size.width
            }
        } else {
            // Abre el menú
            UIView.animate(withDuration: 0.3) {
                self.menuView.frame.origin.x = 0
            }
        }
        isMenuOpen = !isMenuOpen
    }
}

