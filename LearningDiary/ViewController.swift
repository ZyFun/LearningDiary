//
//  ViewController.swift
//  LearningDiary
//
//  Created by Дмитрий Данилин on 07.06.2020.
//  Copyright © 2020 Дмитрий Данилин. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var fiveTF: UITextField!
    @IBOutlet weak var fourTF: UITextField!
    @IBOutlet weak var threeTF: UITextField!
    @IBOutlet weak var twoTF: UITextField!
    
    @IBOutlet weak var resoultLabel: UILabel!
    
    @IBAction func clearButton(_ sender: UIButton) {
        fiveTF.text = ""
        fourTF.text = ""
        threeTF.text = ""
        twoTF.text = ""
    }
    
    @IBAction func calculationButton(_ sender: UIButton) {
        
        //создаем массивы оценок
        let fiveArray = Array(repeating: 5, count: Int(fiveTF.text ?? "") ?? 0)
        let fourArray = Array(repeating: 4, count: Int(fourTF.text ?? "") ?? 0)
        let threeArray = Array(repeating: 3, count: Int(threeTF.text ?? "") ?? 0)
        let twoArray = Array(repeating: 2, count: Int(twoTF.text ?? "") ?? 0)
        
        //создаём общий массив и добавляем в него данные из массивов оценок
        var arrayMark = [Int]()
        arrayMark.append(contentsOf: fiveArray)
        arrayMark.append(contentsOf: fourArray)
        arrayMark.append(contentsOf: threeArray)
        arrayMark.append(contentsOf: twoArray)
        
        //вычисляем общюю сумму массива
        var mark: Double = 0
        for i in arrayMark {
            mark += Double(i)
        }
        
        if arrayMark.isEmpty == true {
            resoultLabel.text = "Введите оценки"
        } else {
            //вычисляем среднее значение оценок
            let totalMark = (mark / Double(arrayMark.count))
            //округляем до Х.ХХ и выводим результат
            resoultLabel.text = String(round(totalMark * 100) / 100)
        }
    }
    
    //скрываем клавиатуру по нажатию на любую область экрана, кроме редактируемой
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //Функция для ограничения ввода символов в поля ввода (разобраться подробнее, как работает этот кусок кода)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let currentCharacterCount = textField.text?.count ?? 0

        if (range.length + range.location > currentCharacterCount){
            return false

        }
        let newLength = currentCharacterCount + string.count - range.length

        var maxLength = 0
        if textField.isEqual(fiveTF) {
            maxLength = 3
        } else if textField.isEqual(fourTF) {
            maxLength = 3
        } else if textField.isEqual(threeTF) {
            maxLength = 3
        } else if textField.isEqual(twoTF) {
            maxLength = 3
        }

        return newLength <= maxLength

    }
    
    //Пока что никак не используемая функция
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

