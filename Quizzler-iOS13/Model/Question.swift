//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by 이상지 on 6/22/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
  let question: String
  let answer: String
  
  init(q question: String, a answer: String) {
    self.question = question
    self.answer = answer
  }
}
