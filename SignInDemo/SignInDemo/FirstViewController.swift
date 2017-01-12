//
//  FirstViewController.swift
//  SignInDemo
//
//  Created by Arvin Mai on 1/11/17.
//  Copyright © 2017 Arvin Mai. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    // input text field for 4-digit numbers
    @IBOutlet weak var textFieldDigitInput: UITextField!
    
    // special buttons
    @IBOutlet var buttonReset: UIButton!
    @IBOutlet weak var buttonDelete: UIButton!
    
    // all digit buttons
    @IBOutlet weak var buttonZero: UIButton!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var buttonSix: UIButton!
    @IBOutlet weak var buttonSeven: UIButton!
    @IBOutlet weak var buttonEight: UIButton!
    @IBOutlet weak var buttonNine: UIButton!
    
    // button collection except reset button
    @IBOutlet var buttonGroup: [UIButton]!
    
    // label to display child info
    var labelChildInfo:UILabel!
    // button to sign in
    @IBOutlet weak var buttonSignIn: UIButton!
    
        
    @IBAction func numberButtonPressed(sender:AnyObject) {
        
        let digit = sender.titleForState(.Normal)!
        let text = "\(textFieldDigitInput.text!)"
        let count = text.characters.count
        if count == 0 {
            textFieldDigitInput.text = "\(digit)"
        } else if count < 4 {
            let newText = text + "\(digit)";
            textFieldDigitInput.text = "\(newText)"
        }
        
        // condition for phone information complete, prepare to send info to server
        if count == 3 {
            // send infomation to server
            
            // clear textfield
            //textFieldDigitInput.text = ""
            
            
            // create label to display child info(device width:768, height: 1024)
            // view bottom to textfield top is 614, view top to signin label bottom is 52
            // label height is 48
            labelChildInfo = UILabel(frame:CGRect(x:227, y:207, width: 200, height:21))
            labelChildInfo.font = UIFont(name:labelChildInfo.font!.fontName, size: 40)
            labelChildInfo.textAlignment = .Center
            labelChildInfo.text = "李其霖(Jack Lee)"
            labelChildInfo.sizeToFit()
            print("\(labelChildInfo.bounds.size.height)")
            print("\(labelChildInfo.bounds.size.width)")
            self.view.addSubview(labelChildInfo)
            
            // show button to sign in and move position
            //buttonSignIn.frame.origin = CGPoint(x:570, y:207)
            buttonSignIn.hidden = false
            buttonSignIn.enabled = true
            // disable all button except reset
            for button in buttonGroup {
                button.enabled = false
            }
        }
    }
    
    @IBAction func deleteButtonPressed(sender:AnyObject) {
        let text: String = textFieldDigitInput.text!
        if text.characters.count != 0 {
            textFieldDigitInput.text  = text.substringToIndex(text.endIndex.predecessor())
        }
    }
    
    @IBAction func resetButtonPressed(sender:AnyObject) {
        textFieldDigitInput.text = ""
        
        // enable all button
        for button in buttonGroup {
            button .enabled = true
        }
        labelChildInfo.hidden = true
        buttonSignIn.hidden = true
    }
    
    @IBAction func signInButtonPressed(sender: AnyObject) {
        let alert = UIAlertController(title:"SignIn", message: "Are you sure to Sign in?", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: {(action: UIAlertAction!) in
            print("ready to sign in!")
            self.buttonSignIn.enabled = false
            self.labelChildInfo.text = "Done!"
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: {(action: UIAlertAction!) in
            print("cancel sign in!")
        }))
        presentViewController(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SignIn")
        textFieldDigitInput.userInteractionEnabled = false
        // enlarge font size in textfield
        textFieldDigitInput.font = UIFont(name: textFieldDigitInput.font!.fontName, size: 80)
        // Do any additional setup after loading the view, typically from a nib.
        // disable the sign in button
        buttonSignIn.hidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

