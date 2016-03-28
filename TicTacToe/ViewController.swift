//
//  ViewController.swift
//  TicTacToe
//
//  Created by Rupin Bhalla on 1/1/16.
//  Copyright © 2016 Rupin Bhalla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var XorO = 1;
    var gameOver = false;
    var tie = false;
    var count = 0;
   
    
    // 0 = Nothing
    // 1 = X
    // 2 = 0
    var arrayOfElements = [0, 0, 0, 0, 0, 0, 0, 0, 0];
    
    var gameDecisions = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]];
    
    var quickCheck = [Int]();
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var horizontalPlayAgainButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        resultLabel.center = CGPointMake(resultLabel.center.x - 600, resultLabel.center.y)
        
        playAgainButton.center = CGPointMake(playAgainButton.center.x, playAgainButton.center.y - 500)
        
        horizontalPlayAgainButton.center = CGPointMake(playAgainButton.center.x, playAgainButton.center.y - 500)
        
        resultLabel.alpha = 0;
        
        playAgainButton.alpha = 0;
        
        horizontalPlayAgainButton.alpha = 0;
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func imageMove()
    {
        resultLabel.alpha = 1;
        playAgainButton.alpha = 1;
        horizontalPlayAgainButton.alpha = 1;
        UIView.animateWithDuration(1) { () -> Void in
            
            self.resultLabel.center = CGPointMake(self.resultLabel.center.x + 600, self.resultLabel.center.y)
            
            self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x, self.playAgainButton.center.y + 500)
            
            self.horizontalPlayAgainButton.center = CGPointMake(self.playAgainButton.center.x, self.playAgainButton.center.y + 500)
            
        }
    }

    @IBAction func buttonPressed(sender: AnyObject)
    {
        if(!gameOver)
        {
            if(arrayOfElements[sender.tag] == 0)
            {
                if(XorO == 1)
                {
                    sender.setImage(UIImage(named: "cross.png"), forState: .Normal)
                    XorO = 2;
                    arrayOfElements[sender.tag] = 1;
                    count++;
                    
                    
                }
                    
                else if(XorO == 2)
                {
                    sender.setImage(UIImage(named: "nought.png"), forState: .Normal);
                    XorO = 1;
                    arrayOfElements[sender.tag] = 2;
                    count++;
                }
            }
            
            for combination in gameDecisions
            {
                if(arrayOfElements[combination[0]] != 0 && arrayOfElements[combination[0]] == arrayOfElements[combination[1]] && arrayOfElements[combination[1]] == arrayOfElements[combination[2]])
                {
                    if(arrayOfElements[combination[0]] == 1)
                    {
                        print("Xs Won")
                        resultLabel.text = "Xs Won";
                        //tie = false
                        
                    }
                    else
                    {
                        print("Os Won")
                        resultLabel.text = "Os Won";
                        //tie = false;
                        
                    }
                    
                    imageMove();
                    gameOver = true;
                    
                }
                
            }
            
            // if it is false and all of them are filled 
            
            if(count == 9 && !gameOver)
            {
                resultLabel.text = "There has been a tie"
                imageMove();
            }
        
        }
        
        
    }
    
    @IBAction func playAgain(sender: AnyObject)
    {
        gameOver = false;
        
        arrayOfElements = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        resultLabel.alpha = 0;
        
        playAgainButton.alpha = 0;
        
        count = 0;
        
        horizontalPlayAgainButton.alpha = 0;
        
        XorO = 1;
        
        tie = false;
        
        resultLabel.center = CGPointMake(resultLabel.center.x - 600, resultLabel.center.y)
        
        playAgainButton.center = CGPointMake(playAgainButton.center.x, playAgainButton.center.y - 500)
        
        var buttonToClear: UIButton
        
        for(var i = 0; i < 9; i++)
        {
            buttonToClear = view.viewWithTag(i) as! UIButton;
            
            buttonToClear.setImage(nil, forState: .Normal)
            
        }
        
        
    }
    
}

