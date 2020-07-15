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
        fiveTF.text = nil
        fourTF.text = nil
        threeTF.text = nil
        twoTF.text = nil
    }
    
    @IBAction func calculationButton(_ sender: UIButton) {
        
        //Создаём константы для записи вычислений количества оценок
        let countFive = Double(fiveTF.text ?? "") ?? 0
        let five = 5 * countFive
        let countFour = Double(fourTF.text ?? "") ?? 0
        let four = 4 * countFour
        let countThree = Double(threeTF.text ?? "") ?? 0
        let three = 3 * countThree
        let countTwo = Double(twoTF.text ?? "") ?? 0
        let two = 2 * countTwo

        //Считаем общую сумму всех чисел и количество оценок
        let resoultMark = five + four + three + two
        let countMark = countFive + countFour + countThree + countTwo

        let bool = resoultMark > 0
        switch bool {
        case true:
            //вычисляем среднее значение оценок
            let totalMark = (resoultMark / countMark)
            //округляем до Х.ХХ и выводим результат
            resoultLabel.text = String(round(totalMark * 100) / 100)
        default:
            resoultLabel.text = "Введите оценки"
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

