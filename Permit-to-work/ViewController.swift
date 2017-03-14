//
//  ViewController.swift
//  Permit-to-work
//
//  Created by danick sikkema on 14-03-17.
//  Copyright © 2017 danick sikkema. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let questions = ["Question 1", "Question 2", "Question 3", "Question 4"]
    var currentQuestionIndex = 1
    
    func nextQuestion() {
        if currentQuestionIndex < questions.count {
            questionLabel.text = questions[currentQuestionIndex]
            currentQuestionIndex += 1
        } else {
            questionLabel.text = "you are done"
            print("No more elements to display.")
        }
    }


    @IBOutlet weak var questionLabel: UILabel!
    
    @IBAction func noButton(_ sender: Any) {
        nextQuestion()
    }
    
    @IBAction func yesButton(_ sender: Any) {

        

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // set first question in label on loading
        questionLabel.text = questions.first
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

