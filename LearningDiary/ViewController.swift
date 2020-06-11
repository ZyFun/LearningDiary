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
        
        let five = Int(fiveTF.text ?? "")
        let fiveArray = Array(repeating: 5, count: five ?? 0)
        let four = Int(fourTF.text ?? "")
        let fourArray = Array(repeating: 4, count: four ?? 0)
        let three = Int(threeTF.text ?? "")
        let threeArray = Array(repeating: 3, count: three ?? 0)
        let two = Int(twoTF.text ?? "")
        let twoArray = Array(repeating: 2, count: two ?? 0)
        
        var arrayMark = [Int]()
        arrayMark.append(contentsOf: fiveArray)
        arrayMark.append(contentsOf: fourArray)
        arrayMark.append(contentsOf: threeArray)
        arrayMark.append(contentsOf: twoArray)
        
        var mark = 0.00
        for i in arrayMark {
            mark += Double(i)
        }
        
        let totalMark = (mark / Double(arrayMark.count))
        
        resoultLabel.text = NSString(format: "%.2f", totalMark) as String
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }



}

