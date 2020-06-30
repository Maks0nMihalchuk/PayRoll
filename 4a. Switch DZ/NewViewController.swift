//
//  NewViewController.swift
//  4a. Switch DZ
//
//  Created by maks on 28.06.2020.
//  Copyright © 2020 maks. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    let totalLable = UILabel()
    
    var total  = ViewController.money - (ViewController.avans + ViewController.soch + ViewController.pdv)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .darkGray
        self.totalLable.frame = CGRect(x: 110, y: 150, width: 200, height: 80)
        self.totalLable.numberOfLines = 0
        
        self.totalLable.textAlignment = .center
        
        self.totalLable.text = "Ваша чистая зарплата в конце месяца составит: " + String(total)
        self.view.addSubview(self.totalLable)

        print("Это результат", totalLable.text!)
    }
    

    @IBAction func goBack(_ sender: Any) {
        ViewController.money = Double()
        dismiss(animated: true, completion: nil)
    }
    
}
