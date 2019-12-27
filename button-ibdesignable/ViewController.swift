//
//  ViewController.swift
//  button-ibdesignable
//
//  Created by miguel tomairo on 12/26/19.
//  Copyright © 2019 rapser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var boton1: RoundButton!
    
    let boton2 = RoundButton(type: .system)

    fileprivate func createButtonWithCode() {
        boton2.frame = CGRect(x: 20, y: 100, width: 200, height: 40)
        boton2.backgroundColor = UIColor.red
        boton2.setTitleColor(UIColor.white, for: .normal)
        boton2.setTitle("Cancelar", for: .normal)
        boton2.cornerRadius = 5.0
        
        self.view.addSubview(boton2)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createButtonWithCode()
    }


}

