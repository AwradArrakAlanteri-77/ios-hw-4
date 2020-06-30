//
//  ViewController.swift
//  iOS-CW-5-P2
//
//  Created by Awrad Awrad on 4/8/1399 AP.
//  Copyright © 1399 Awrad Awrad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var turnLabel: UILabel!
    
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    
    var buttons: [UIButton] = []
    var counter = 0
    
    @IBAction func press(_ sender: UIButton)
{
        if counter % 2 == 0 {
            sender.setTitle("X", for: .normal)
            sender.setTitleColor(.green, for: .normal)
            turnLabel.text = "O turn"
        }
        else {
            sender.setTitle("O", for: .normal)
            sender.setTitleColor(.red, for: .normal)
            turnLabel.text = "X turn"
        }
    counter += 1
    sender.isEnabled = false
    winning(winner: "X")
    winning(winner: "O")
}
    @IBAction func restTapped() {
        restartGame()
    }
    
    func winning(winner: String)
{
        if (b1.titleLabel?.text == winner && b2.titleLabel?.text == winner && b3.titleLabel?.text == winner) ||
           (b4.titleLabel?.text == winner && b5.titleLabel?.text == winner && b6.titleLabel?.text == winner) ||
           (b7.titleLabel?.text == winner && b8.titleLabel?.text == winner && b9.titleLabel?.text == winner) ||
           (b1.titleLabel?.text == winner && b4.titleLabel?.text == winner && b7.titleLabel?.text == winner) ||
           (b2.titleLabel?.text == winner && b5.titleLabel?.text == winner && b8.titleLabel?.text == winner) ||
           (b3.titleLabel?.text == winner && b6.titleLabel?.text == winner && b9.titleLabel?.text == winner) ||
           (b1.titleLabel?.text == winner && b5.titleLabel?.text == winner && b9.titleLabel?.text == winner) ||
           (b3.titleLabel?.text == winner && b5.titleLabel?.text == winner && b7.titleLabel?.text == winner)
        {
            print("\(winner) هنيئاً لقد فزت")

            let alertController = UIAlertController(title: "🎊\(winner) لقد فاز", message: "قم بالضغط علي الزر التالي لكي يتم إعادة اللعب", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "إعادة اللعب", style: .cancel) { (alert) in
                self.restartGame()
            }
            alertController.addAction(restartAction)
            present(alertController, animated: true, completion: nil)
        }
        else if counter == 9
   {
    let alertController = UIAlertController(title: "تعادل", message: "قم بالضغط علي الزر التالي لكي يتم إعادة اللعب", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "إعادة اللعب", style: .cancel) { (alert) in
                self.restartGame()
            }
            alertController.addAction(restartAction)
            present(alertController, animated: true, completion: nil)
    }
        
}
    func restartGame()
{
        for b in buttons {
            b.setTitle("", for: .normal)
            b.titleLabel?.text = ""
            b.isEnabled = true
        }
        counter = 0
        turnLabel.text = "X turn"
}
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       buttons = [b1,b2,b3,b4,b5,b6,b7,b8,b9]
    }
}
