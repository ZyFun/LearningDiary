//
//  ViewController.swift
//  LearningDiary
//
//  Created by Дмитрий Данилин on 07.06.2020.
//  Copyright © 2020 Дмитрий Данилин. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var fiveTF: UITextField!
    @IBOutlet weak var fourTF: UITextField!
    @IBOutlet weak var threeTF: UITextField!
    @IBOutlet weak var twoTF: UITextField!
    
    @IBOutlet weak var resoultLabel: UILabel!
    
    @IBAction func calculationButton(_ sender: UIButton) {
        
        let fiveArray = Array(repeating: 5, count: Int(fiveTF.text ?? "") ?? 0)
        let fourArray = Array(repeating: 4, count: Int(fourTF.text ?? "") ?? 0)
        let threeArray = Array(repeating: 3, count: Int(threeTF.text ?? "") ?? 0)
        let twoArray = Array(repeating: 2, count: Int(twoTF.text ?? "") ?? 0)
        
        var arrayMark = [Int]()
        arrayMark.append(contentsOf: fiveArray)
        arrayMark.append(contentsOf: fourArray)
        arrayMark.append(contentsOf: threeArray)
        arrayMark.append(contentsOf: twoArray)
        
        var mark: Double = 0
        for i in arrayMark {
            mark += Double(i)
        }
        
//        let empty = arrayMark.isEmpty
        
        if arrayMark.isEmpty == true {
            resoultLabel.text = "Введите оценки"
        } else {
            let totalMark = (mark / Double(arrayMark.count))
            resoultLabel.text = NSString(format: "%.2f", totalMark) as String
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }



}

