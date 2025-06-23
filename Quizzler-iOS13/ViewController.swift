//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
  
  @IBOutlet weak var QuestionLabel: UILabel!
  @IBOutlet weak var trueButton: UIButton!
  @IBOutlet weak var falseButton: UIButton!
  @IBOutlet weak var progressBar: UIProgressView!
  
  
  //var total = 0
  var questionIndex = 0
  var question = QuizBrain().question
  var player: AVAudioPlayer?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.QuestionLabel.text = self.question[questionIndex].question
  }
  
  
  @IBAction func buttonPressed(_ sender: UIButton) {
    if sender.currentTitle == self.question[questionIndex].answer {
      sender.backgroundColor = .green
      
      self.prepareSound()
    } else {
      sender.backgroundColor = .red
    }
    
    if self.questionIndex < self.question.count - 1 {
      questionIndex += 1
      self.QuestionLabel.text = self.question[questionIndex].question
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
      sender.backgroundColor = .clear
    }
  }
  
  func prepareSound() {
    let path = Bundle.main.path(forResource: "Sound", ofType: "mp3")!
    let url = URL(fileURLWithPath: path)
    
    player = try! AVAudioPlayer(contentsOf: url)
    player?.prepareToPlay()
  }
}
