//
//  DiaryController.swift
//  LearningDiary
//
//  Created by Дмитрий Данилин on 20.06.2020.
//  Copyright © 2020 Дмитрий Данилин. All rights reserved.
//

import UIKit

class DiaryTableViewController: UITableViewController {
    
    var markModel = [
        Mark(mark: "5", courseName: "Основы программирования", lessonName: "Урок 17"),
        Mark(mark: "3", courseName: "Основы программирования", lessonName: "Урок 18"),
        Mark(mark: "4", courseName: "Основы программирования", lessonName: "Урок 19")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        
        //Имя заголовка
        self.title = "Журнал"
        
//        //Отображение кнопки редактирования с левой стороны
//        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveButtonSegue" else { return }
        let sourceVC = segue.source as! NewMarkTableViewController
        let mark = sourceVC.mark
        
        let newIndexPath = IndexPath(row: markModel.count, section: 0)
        markModel.append(mark)
        tableView.insertRows(at: [newIndexPath], with: .fade)
    }

    // MARK: - Table view data source

    //Настройка количества секция в таблице
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    //Настройка количества ячеек в таблице
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //отображаем то количество объектов, которое есть в массиве
        return markModel.count
    }

    //Метод для вызова ячейки в таблицу
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Присваиваем константе ячейку и кастим её до типа DiaryTableViewCell
        let markDiaryCell = tableView.dequeueReusableCell(withIdentifier: "markCell", for: indexPath) as! DiaryTableViewCell
        
        
        //Создаэм константу, которая будет обращатся к конкретной строке ячейки массива
        let objectsMark = markModel[indexPath.row]
        
        //Вызываем модель ячейки с данными
        markDiaryCell.setMark(objectMark: objectsMark)

        return markDiaryCell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

//    //По умолчанию этот метод возвращает .delete. По этому прописывать его не обязательно
//    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        return .delete
//    }
    
    // Метод для удаления данных из массива оценок курсов
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Удаляем данные из ячейки массива, с которой в данный момент взаимодействуем
            markModel.remove(at: indexPath.row)
            // Удаляем данные из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

//    //метод логики перемещения ячеек (доступный только при включенном редактировании ячеек)
//    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//
//        // Удаляем элемент из ячейки массива, присваивая удаленный объект константе
//        let movedMark = markModel.remove(at: sourceIndexPath.row)
//        // Вставляем удаленный объект на новое место
//        markModel.insert(movedMark, at: destinationIndexPath.row)
//        //перезагружаем таблицу для обновления данных
//        //tableView.reloadData()
//    }
    
//    // Метод для включения возможности перемещения ячеек
//    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the item to be re-orderable.
//        return true
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
