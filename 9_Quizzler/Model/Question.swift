//
//  Question.swift
//  9_Quizzler
//
//  Created by pvl kzntsv on 31.01.2023.
//

import UIKit

struct Question {
    var text: String
    var answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}
