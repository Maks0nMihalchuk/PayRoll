//
//  ViewController.swift
//  4a. Switch DZ
//
//  Created by maks on 27.06.2020.
//  Copyright © 2020 maks. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    static var avans = 0.0
    static var soch = 0.0
    static var pdv = 0.0
    
    
    //Картинка
    let imgPayRoll = UIImageView()
    let image = UIImage(named: "MyImg")
    //Текст № 1
    let lableOne = UILabel()
    //Поле для ввода числа
    let textFieldOne = UITextField()
    static var money = Double()
    
    //Текст № 2
    let lableTwo = UILabel()
    
    //Текст № 3
    let lableThree = UILabel()
    
    //Текст № 4
    let lableFour = UILabel()
    
    //Switch №1
    let switchOne = UISwitch()
    //Switch №2
    let switchTwo = UISwitch()
    
    //Switch №3
    let switchThree = UISwitch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Отрисовать Изображение на экране телефона.
        self.imgPayRoll.frame = CGRect(x: 55, y: 60, width: 300, height: 200)
        
        self.imgPayRoll.image = image
        self.view.addSubview(self.imgPayRoll)
        self.view.backgroundColor = .darkGray
        
        //Отрисовать текст № 1
        self.lableOne.frame = CGRect(x: 20, y: 300, width: 200, height: 40)
        self.lableOne.text = "Введите вашу зарплату: "
        self.view.addSubview(self.lableOne)
        
        //Отрисовать поле для ввода числа
        self.textFieldOne.frame = CGRect(x: 220, y: 305, width: 150, height: 31)
        self.textFieldOne.backgroundColor = .white
        self.textFieldOne.placeholder = "Ввeдите число"
        self.textFieldOne.keyboardType = .numbersAndPunctuation
        self.view.addSubview(self.textFieldOne)
        
        textFieldOne.delegate = self
        
        //Отрисовать текст № 2
        self.lableTwo.frame = CGRect(x: 20, y: 360, width: 200, height: 40)
        self.lableTwo.text = "Вычесть аванса - 25%"
        self.view.addSubview(self.lableTwo)
        
        //Отрисовать switch № 1
        self.switchOne.frame = CGRect(x: 300, y: 365, width: 0, height: 0)
        self.view.addSubview(self.switchOne)
        self.switchOne.addTarget(self, action: #selector(switchOneTarget(target:)), for: .valueChanged)
        
        //Отрисовать текст № 3
        self.lableThree.frame = CGRect(x: 20, y: 410, width: 200, height: 40)
        self.lableThree.text = "Социальный збор - 5%"
        self.view.addSubview(self.lableThree)
        
        //Отрисовать switch № 2
        self.switchTwo.frame = CGRect(x: 300, y: 415, width: 0, height: 0)
        self.view.addSubview(self.switchTwo)
        self.switchTwo.addTarget(self, action: #selector(switchTwoTarget(target:)), for: .valueChanged)
        
        //Отрисовать текст № 4
        self.lableFour.frame = CGRect(x: 20, y: 460, width: 200, height: 40)
        self.lableFour.text = "Подоходный налог - 10%"
        self.view.addSubview(self.lableFour)
        
        //Отрисовать switch № 3
        self.switchThree.frame = CGRect(x: 300, y: 465, width: 0, height: 0)
        self.view.addSubview(self.switchThree)
        self.switchThree.addTarget(self, action: #selector(switchThreeTarget(target:)), for: .valueChanged)
        
    }

    
    //Убрать клавиатуру
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print ("textFieldShouldReturn = хотите убрать клавиатуру")
        
        self.textFieldOne.resignFirstResponder()
        
        print (ViewController.money)
        return true
    }
    //Отследить конец ввода и записать введенное число в переменную
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        print ("Ввод числа завершен")
        
        alertOne(title: "Ошибка", message: "Вы ввели некоректное значение. Пожалуйста введите данные правильно", style: .alert, funcTextField: textField)
        
        return true
    }
    // Предуприждение про некоректный ввод.
    func alertOne(title: String, message: String, style: UIAlertController.Style, funcTextField: UITextField) {
        if Double(funcTextField.text!) == nil {

            let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
            let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion: nil)
            
        }else if Double(funcTextField.text!) != nil {

            ViewController.money = Double(funcTextField.text!)!
        }
    }
    
    func alertTwo (title: String, message: String, style: UIAlertController.Style) {
        
        let alertControl = UIAlertController(title: title, message: message, preferredStyle: style)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alertControl.addAction(alertAction)
        self.present(alertControl, animated: true, completion: nil)
    }
    
    //Target для SwitchOne
    @objc func switchOneTarget (target: UISwitch) {
        if target == switchOne {
            if textFieldOne.text != "" {
                if target.isOn {
                    ViewController.avans = ViewController.money * 0.25
                    print(ViewController.avans)
                }
            }else if textFieldOne.text == "" {
                alertTwo(title: "Ошибка", message: "Вы не заполнили обязательное поле. Пожалуйста введите число", style: .alert)
                switchOne.isOn = false
            }
        }
    }
    //Target для SwitchTwo
    @objc func switchTwoTarget (target: UISwitch) {
        if target == switchTwo {
            if textFieldOne.text != "" {
                if target.isOn {
                    ViewController.soch = ViewController.money * 0.05
                    print(ViewController.soch)
                }
            }else if textFieldOne.text == "" {
                alertTwo(title: "Ошибка", message: "Вы не заполнили обязательное поле. Пожалуйста введите число", style: .alert)
                switchTwo.isOn = false
            }
        }
    }
    //Target для SwitchThree
    @objc func switchThreeTarget (target: UISwitch) {
        if target == switchThree {
            if textFieldOne.text != "" {
                if target.isOn {
                    ViewController.pdv = ViewController.money * 0.10
                    print(ViewController.pdv)
                }
            }else if textFieldOne.text == "" {
                alertTwo(title: "Ошибка", message: "Вы не заполнили обязательное поле. Пожалуйста введите число", style: .alert)
                switchThree.isOn = false
            }
        }
    }
    
    @IBAction func toCountButton(_ sender: Any) {
        let storyBord: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newView = storyBord.instantiateViewController(withIdentifier: "vsTwo") as! NewViewController
        
        self.present(newView, animated: true, completion: nil)
        
        switchOne.isOn = false
        switchTwo.isOn = false
        switchThree.isOn = false
        
        
        
    }
    
}

