//
//  DiaryTableViewCell.swift
//  LearningDiary
//
//  Created by Дмитрий Данилин on 20.06.2020.
//  Copyright © 2020 Дмитрий Данилин. All rights reserved.
//

import UIKit

//Кастомная ячейка журнала
class DiaryTableViewCell: UITableViewCell {
    @IBOutlet weak var mark: UILabel!
    @IBOutlet weak var courseName: UILabel!
    @IBOutlet weak var lessonName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
