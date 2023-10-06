//
//  UIViewMenu.swift
//  MenuDrawer
//
//  Created by Armand C.M on 6/10/23.
//

import UIKit

class UIViewMenu: UIView {

    var view: UIView!
    var menuView: UIView!
    var logoMenu: UIView!
    var menuItems: UIView!
    var logoCircle: UIView!
    let topMenu = UIView(frame: CGRect(x: 4, y: 70, width: 385, height: 44))
    let openMenuButton = UIButton(frame: CGRect(x: 20, y: 5, width: 34, height: 34))
    let titApp = UILabel(frame: CGRect(x: 65, y: 0, width: 200, height: 44))
    var menusItems: [UIView] = []

    var isMenuOpen = false

    init(containerView: UIView) {
        super.init(frame: containerView.bounds)
        containerView.addSubview(self)
        self.backgroundColor = UIColor.clear
        setupViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func setupViews() {
        let topMenuView = showTopMenu()
        let menuView = showMenu()
        self.addSubview(topMenuView)
        self.addSubview(menuView)
    }

    func showTopMenu()-> UIView {
        topMenu.backgroundColor = UIColor.orange
        topMenu.layer.cornerRadius = 5
        topMenu.clipsToBounds = false

        if let imagenFondo = UIImage(named: "iconmenup") {
            openMenuButton.setBackgroundImage(imagenFondo, for: .normal)
        }
        openMenuButton.addTarget(self, action: #selector(toggleMenu), for: .touchUpInside)
        topMenu.addSubview(openMenuButton)

        titApp.text = ""
        titApp.textColor = UIColor.white
        let attributedText = NSMutableAttributedString(string: "Som la costera")
        attributedText.addAttributes([NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)], range: NSRange(location: 0, length: attributedText.length))
        titApp.attributedText = attributedText

        topMenu.addSubview(titApp)

        return topMenu
    }

    func showMenu()-> UIView {
        menuView = UIView(frame: CGRect(x: -self.frame.size.width, y: 125, width: 250, height: 695))
        menuView.backgroundColor = UIColor.white
        menuView.layer.cornerRadius = 15
        menuView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        menuView.clipsToBounds = false
        menuView.layer.shadowColor = UIColor.black.cgColor
        menuView.layer.shadowOpacity = 0.5
        menuView.layer.shadowOffset = CGSize(width: 2, height: 2)
        menuView.layer.shadowRadius = 4

        logoMenu = UIView(frame: CGRect(x: 0, y: 0, width: 250, height: 250))
        logoMenu.backgroundColor = UIColor.orange
        logoMenu.layer.cornerRadius = 15
        logoMenu.layer.maskedCorners = [.layerMaxXMinYCorner]
        logoMenu.clipsToBounds = true

        logoCircle = UIView(frame: CGRect(x: 10, y: 10, width: 230, height: 230))
        logoCircle.backgroundColor = UIColor.white
        logoCircle.layer.cornerRadius = logoCircle.frame.width / 2
        logoCircle.clipsToBounds = true

        let logoImage = UIImageView(image: UIImage(named: "logosomlacostera"))
        logoImage.contentMode = .scaleAspectFit
        logoImage.frame = CGRect(x: 10, y: 0, width: 200, height: 200)
        logoCircle.addSubview(logoImage)

        logoMenu.addSubview(logoCircle)
        menuView.addSubview(logoMenu)

        menuItems = UIView(frame: CGRect(x: 10, y: 260, width: 200, height: 230))

        let iconoMenu = UIImageView(image: UIImage(named: "iconoacceso"))
        iconoMenu.contentMode = .scaleAspectFit
        iconoMenu.frame = CGRect(x: 30, y: 5, width: 30, height: 30)
        menuItems.addSubview(iconoMenu)

        let menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 44))
        menuButton.setTitle("Menu 1", for: .normal)
        menuButton.setTitleColor(UIColor.black, for: .normal)
        menuButton.tag = 1
        menuButton.addTarget(self, action: #selector(menuAction), for: .touchUpInside)
        menuItems.addSubview(menuButton)

        menuView.addSubview(menuItems)
        self.addSubview(menuView)

        return menuView
    }

    @objc func toggleMenu() {
        if isMenuOpen {
            // Cierra el menú
            UIView.animate(withDuration: 0.3) {
                self.menuView.frame.origin.x = -self.frame.size.width
            }
        } else {
            // Abre el menú
            UIView.animate(withDuration: 0.3) {
                self.menuView.frame.origin.x = 0
            }
        }
        isMenuOpen = !isMenuOpen
    }

    @objc func menuAction(sender: UIButton){
        toggleMenu()
        print("Has pulsado el Menu\(sender.tag)")
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
}
