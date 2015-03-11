//
//  ViewController.swift
//  blackJack13
//
//  Created by Kushal Jogi on 3/2/15.
//  Copyright (c) 2015 Kushal Jogi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var pasint :Int!
    var dasint :Int!
    @IBOutlet weak var textNofPlayer: UITextField!

    @IBOutlet weak var textNofDecks: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       // println("\(pasint)")
        textNofPlayer.text = "2"
        textNofDecks.text = "3"
    }
    
    @IBOutlet weak var start: UIButton!
    @IBAction func startButton(sender: AnyObject){
        pasint = textNofPlayer.text.toInt()!
        dasint = textNofDecks.text.toInt()!
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let controller = segue.destinationViewController as ViewController2
        pasint = textNofPlayer.text.toInt()!
        dasint = textNofDecks.text.toInt()!
        controller.nofplayers = pasint
        controller.nofdecks = dasint
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
