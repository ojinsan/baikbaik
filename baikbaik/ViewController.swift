//
//  ViewController.swift
//  baikbaik
//
//  Created by Fauzan Ramadhan on 05/03/20.
//  Copyright © 2020 Fauzan Ramadhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    func currentHour() -> Int {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        //let minutes = calendar.component(.minute, from: date)
        return hour
    }
  
    func currentMinute() -> Int {
        let date = Date()
        let calendar = Calendar.current
        //let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        return minute
    }
    
    var gameTimer: Timer?
    
    //Done Statement for a Day
    var isDoneOne = false
    var isDoneTwo = false
    var isDoneThree = false
    var listDisplayed = 0
    
    //FORM FILL and Check Buuton
    @IBOutlet weak var formOne: UITextField!
    @IBOutlet weak var formTwo: UITextField!
    @IBOutlet weak var formThree: UITextField!
    @IBOutlet weak var checkOne: UIButton!
    @IBOutlet weak var checkTwo: UIButton!
    @IBOutlet weak var checkThree: UIButton!
    
    //Card One Variable
    var iCountOne = 0
    var iStreaksOne = 0
    var iBestStreaksOne = 0
    @IBOutlet weak var cardOne: UIView!
    @IBOutlet weak var nameOne: UILabel!
    @IBOutlet weak var countOne: UILabel!
    @IBOutlet weak var streaksOne: UILabel!
    @IBOutlet weak var bestStreaksOne: UILabel!
    @IBOutlet weak var doneButtonOne: UIButton!
    @IBOutlet weak var undoneButtonOne: UIButton!
    
    //Card Two Variable
    var iCountTwo = 0
    var iStreaksTwo = 0
    var iBestStreaksTwo = 0
    @IBOutlet weak var cardTwo: UIView!
    @IBOutlet weak var nameTwo: UILabel!
    @IBOutlet weak var countTwo: UILabel!
    @IBOutlet weak var streaksTwo: UILabel!
    @IBOutlet weak var bestStreaksTwo: UILabel!
    @IBOutlet weak var doneButtonTwo: UIButton!
    @IBOutlet weak var undoneButtonTwo: UIButton!
    
    
    //Card Three Variable
    var iCountThree = 0
    var iStreaksThree = 0
    var iBestStreaksThree = 0
    @IBOutlet weak var cardThree: UIView!
    @IBOutlet weak var nameThree: UILabel!
    @IBOutlet weak var countThree: UILabel!
    @IBOutlet weak var streaksThree: UILabel!
    @IBOutlet weak var bestStreaksThree: UILabel!
    @IBOutlet weak var doneButtonThree: UIButton!
    @IBOutlet weak var undoneButtonThree: UIButton!
    
    
    ///Looping Check
    @objc func runTimedCode(){
        print ("checking time")
        let x = currentHour()
        let y = currentMinute()
        if (x == 23 && y == 59){
            if (isDoneOne == false){
                if (iStreaksOne > iBestStreaksOne){
                    iBestStreaksOne = iStreaksOne
                }
                iStreaksOne = 0
                streaksOne.text = "\(iStreaksOne)"
                bestStreaksOne.text = "\(iBestStreaksOne)"
            } else if (isDoneTwo == false){
                if (iStreaksTwo > iBestStreaksTwo){
                    iBestStreaksTwo = iStreaksTwo
                }
                iStreaksTwo = 0
                streaksTwo.text = "\(iStreaksTwo)"
                bestStreaksTwo.text = "\(iBestStreaksTwo)"
            } else if (isDoneThree == false){
                if (iStreaksThree > iBestStreaksThree){
                    iBestStreaksThree = iStreaksThree
                }
                iStreaksThree = 0
                streaksThree.text = "\(iStreaksThree)"
                bestStreaksThree.text = "\(iBestStreaksThree)"
            }
            
            isDoneOne = false
            isDoneTwo = false
            isDoneThree = false
            doneButtonOne.isHidden = false
            doneButtonTwo.isHidden = false
            doneButtonThree.isHidden = false
        }
    }
    
    //MAIN------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // formOne.resignFirstResponder()
        //removefromsuperview
        //bikin tap gesture di view
        
        //atau mainin delegate text field
        //modal..
        //segmented control,
        //bikin model struct
        //function dari paramtrr
        //table/collection
        
        gameTimer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
        
        let a = Date()
        print(a)
        
        cardOne.layer.cornerRadius = 10
        cardTwo.layer.cornerRadius = 10
        cardThree.layer.cornerRadius = 10
        cardOne.isHidden = true
        cardTwo.isHidden = true
        cardThree.isHidden = true
        nameOne.isHidden = true
        nameTwo.isHidden = true
        nameThree.isHidden = true
        doneButtonOne.isHidden = true
        doneButtonTwo.isHidden = true
        doneButtonThree.isHidden = true
        undoneButtonOne.isHidden = true
        undoneButtonTwo.isHidden = true
        undoneButtonThree.isHidden = true
        countOne.isHidden = true
        countTwo.isHidden = true
        countThree.isHidden = true
        streaksOne.isHidden = true
        streaksTwo.isHidden = true
        streaksThree.isHidden = true
        bestStreaksOne.isHidden = true
        bestStreaksTwo.isHidden = true
        bestStreaksThree.isHidden = true
    }
    
    

    @IBAction func addButton(_ sender: Any) {
        listDisplayed += 1
        if (listDisplayed == 1){
            cardOne.isHidden = false
        } else if (listDisplayed == 2){
            cardTwo.isHidden = false
        } else {
            cardThree.isHidden = false
        }
    }
    ///
    
    @IBAction func fillForm(_ sender: UIButton) {
        switch sender {
        case checkOne:
            nameOne.isHidden = false
            formOne.isHidden = true
            sender.isHidden = true
            nameOne.text = formOne.text
            doneButtonOne.isHidden = false
            countOne.isHidden = false
            streaksOne.isHidden = false
            bestStreaksOne.isHidden = false
        case checkTwo:
            nameTwo.isHidden = false
            formTwo.isHidden = true
            sender.isHidden = true
            nameTwo.text = formTwo.text
            doneButtonTwo.isHidden = false
            countTwo.isHidden = false
            streaksTwo.isHidden = false
            bestStreaksTwo.isHidden = false
        case checkThree:
            nameThree.isHidden = false
            formThree.isHidden = true
            sender.isHidden = true
            nameThree.text = formThree.text
            doneButtonThree.isHidden = false
            countThree.isHidden = false
            streaksThree.isHidden = false
            bestStreaksThree.isHidden = false
        default:
            print("nothing")
        }
    }
    
    @IBAction func doneOne(_ sender: Any) {
        iCountOne += 1
        iStreaksOne += 1
        if (iStreaksOne > iBestStreaksOne){
            iBestStreaksOne = iStreaksOne
        }
        countOne.text = "\(iCountOne)"
        streaksOne.text = "\(iStreaksOne)"
        bestStreaksOne.text = "\(iBestStreaksOne)"
        isDoneOne = true
        doneButtonOne.isHidden = true
    }
    
//    @IBAction func undoneOne(_ sender: Any) {
//        if (iStreaksOne > iBestStreaksOne){
//            iBestStreaksOne = iStreaksOne
//        }
//        iStreaksOne = 0
//        streaksOne.text = "\(iStreaksOne)"
//        bestStreaksOne.text = "\(iBestStreaksOne)"
//    }
    
    @IBAction func doneTwo(_ sender: Any) {
        iCountTwo += 1
        iStreaksTwo += 1
        if (iStreaksTwo > iBestStreaksTwo){
            iBestStreaksTwo = iStreaksTwo
        }
        countTwo.text = "\(iCountTwo)"
        streaksTwo.text = "\(iStreaksTwo)"
        bestStreaksTwo.text = "\(iBestStreaksTwo)"
        isDoneTwo = true
        doneButtonTwo.isHidden = true
    }
    
//    @IBAction func undoneTwo(_ sender: Any) {
//        if (iStreaksTwo > iBestStreaksTwo){
//            iBestStreaksTwo = iStreaksTwo
//        }
//        iStreaksTwo = 0
//        streaksTwo.text = "\(iStreaksTwo)"
//        bestStreaksTwo.text = "\(iBestStreaksTwo)"
//    }
//
    
    @IBAction func doneThree(_ sender: Any) {
        iCountThree += 1
        iStreaksThree += 1
        if (iStreaksThree > iBestStreaksThree){
            iBestStreaksThree = iStreaksThree
        }
        countThree.text = "\(iCountThree)"
        streaksThree.text = "\(iStreaksThree)"
        bestStreaksThree.text = "\(iBestStreaksThree)"
        isDoneThree = true
        doneButtonThree.isHidden = true
    }
    
//    @IBAction func undoneThree(_ sender: Any) {
//        if (iStreaksThree > iBestStreaksThree){
//            iBestStreaksThree = iStreaksThree
//        }
//        iStreaksThree = 0
//        streaksThree.text = "\(iStreaksThree)"
//        bestStreaksThree.text = "\(iBestStreaksThree)"
//    }
    
    
}

