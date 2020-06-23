//
//  NewMarkTableViewController.swift
//  LearningDiary
//
//  Created by Дмитрий Данилин on 23.06.2020.
//  Copyright © 2020 Дмитрий Данилин. All rights reserved.
//

import UIKit

class NewMarkTableViewController: UITableViewController {

    var mark = Mark(mark: "",  courseName: "", lessonName: "")
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var markTFE: UITextField!
    @IBOutlet weak var courseTFE: UITextField!
    @IBOutlet weak var lessonTFE: UITextField!
    
    // Функция, обращаясь к которой кнопка сохранения буудет не доступна, пока не введены данные
    private func updateSaveButton() {
        
        //константы с проверкой, есть ли какой либо текст в поле ввода, и если его нет присваивается пустая строка.
        let markText = markTFE.text ?? ""
        let courseText = courseTFE.text ?? ""
        let lessonText = lessonTFE.text ?? ""
        
        // Если строки не пустые, кнопка активна
        saveButton.isEnabled = !markText.isEmpty && !courseText.isEmpty && !lessonText.isEmpty
    }
    
    private func updateUI() {
        markTFE.text = mark.mark
        courseTFE.text = mark.courseName
        lessonTFE.text = mark.lessonName
    }
     
    @IBAction func textAdd(_ sender: Any) {
        // Активация недоступности кнопки сохранения
        updateSaveButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Кнопка не доступна при загрузке экрана
        updateSaveButton()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        // Проверяем, по какому идентификатору срабатывает segue, и если всё в порядке, идем дальше.
        guard segue.identifier == "saveButtonSegue" else { return }
        
        let mark = markTFE.text ?? ""
        let course = courseTFE.text ?? ""
        let lesson = lessonTFE.text ?? ""
        
        self.mark = Mark(mark: mark, courseName: course, lessonName: lesson)
    }
}
