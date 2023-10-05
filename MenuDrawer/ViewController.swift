//
//  ViewController.swift
//  MenuDrawer
//
//  Created by Armand Casells on 5/10/23.
//

import UIKit

class ViewController: UIViewController {

    var menuView: UIView!
    let openMenuButton = UIButton(frame: CGRect(x: 20, y: 70, width: 100, height: 44))
    
    var isMenuOpen = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        openMenuButton.backgroundColor = UIColor.black
        openMenuButton.setTitle("Open Menu", for: .normal)
        openMenuButton.addTarget(self, action: #selector(toggleMenu), for: .touchUpInside)
        self.view.addSubview(openMenuButton)
        
        menuView = UIView(frame: CGRect(x: -self.view.frame.size.width, y: 120, width: 250, height: 700))
        menuView.backgroundColor = UIColor.white // Puedes personalizar el color como desees
        menuView.layer.cornerRadius = 15 // Ajusta el valor según sea necesario para obtener el redondeo deseado
        menuView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        menuView.clipsToBounds = false
        menuView.layer.shadowColor = UIColor.black.cgColor // Color de la sombra
        menuView.layer.shadowOpacity = 0.5 // Opacidad de la sombra (0.0 a 1.0)
        menuView.layer.shadowOffset = CGSize(width: 2, height: 2) // Desplazamiento de la sombra
        menuView.layer.shadowRadius = 4 // Radio de la sombra
        self.view.addSubview(menuView)

    }

    @objc func toggleMenu() {
        if isMenuOpen {
            // Cierra el menú
            UIView.animate(withDuration: 0.3) {
                self.menuView.frame.origin.x = -self.view.frame.size.width
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

