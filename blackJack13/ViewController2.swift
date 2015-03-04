//
//  ViewController2.swift
//  blackJack13
//
//  Created by Kushal Jogi on 3/2/15.
//  Copyright (c) 2015 Kushal Jogi. All rights reserved.
//

//import Foundation
import UIKit

class ViewController2: UIViewController {
    
   
    @IBOutlet weak var newGameButton: UIButton!
    
    @IBOutlet weak var standButton: UIButton!
    
    @IBOutlet weak var hitButton: UIButton!
    
    @IBOutlet weak var playerNumberLabel: UILabel!
  
    @IBOutlet weak var oneButton: UIButton!
    
    @IBOutlet weak var fiveButton: UIButton!
    
    @IBOutlet weak var tenButton: UIButton!
  
    @IBOutlet weak var bidValue: UILabel!
    
    @IBOutlet weak var dealButton: UIButton!
    
    @IBOutlet weak var playerCards: UITextView!
    
    @IBOutlet weak var dealerCards: UITextView!
 
    
    @IBOutlet weak var money: UILabel!
    
    @IBOutlet weak var roundNumber: UILabel!
    
    var dealerString : String!
    var playerString : String!
    var roundCounter = 1
    var nofplayers :Int = 2
    var nofdecks: Int = 3
    var players : [Player] = [Player]()
    var dealer : Dealer = Dealer(dname: "dealer", dhands: Hand())
    var playingPlayer = 0
   // var shoe:[Card]
    var shoe :[Card] = []
    var c : [Card] = []
    var my : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // newGameButton.enabled = false
        standButton.enabled = false
        hitButton.enabled = false
       
        playerNumberLabel.text = "1"
        players.append(Player(pname: "1", pmoney: 100, phands: Hand()))
        players.append(Player(pname: "2", pmoney: 100, phands: Hand()))
        if nofplayers > 2 {
            for playernumber in 2..<nofplayers{
                players.append(Player(pname: "\(playernumber)", pmoney: 100, phands: Hand()))
            }
        }
        
        
        for p :Player in players { println("\(p.name)") }
        
        var mydeck = Deck().gdeck() + Deck().gdeck() + Deck().gdeck()
        
        if nofdecks > 3{
            let extra = nofdecks - 3
            for d in 1...extra{
                mydeck += Deck().gdeck()
            }
            
        }
        shoe = Deck().shuffle(mydeck)
      
        
        
        for card1 : Card in shoe { println("\(card1.rank.values.r)\(card1.suite.rawValue)")}

        println("\(countElements(shoe))")
        println("\(countElements(mydeck))")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func onePressed(sender: AnyObject) {
        players[playingPlayer].money -= 1
        players[playingPlayer].hands.bet += 1
        self.bidValue.text = "\(players[playingPlayer].hands.bet)"
        self.money.text = "\(players[playingPlayer].money)"
    }
    
    @IBAction func fivePressed(sender: AnyObject) {
        players[playingPlayer].money -= 5
        players[playingPlayer].hands.bet += 5
        self.bidValue.text = "\(players[playingPlayer].hands.bet)"
        self.money.text = "\(players[playingPlayer].money)"
        
        
     /*   currmoney -= 5
        currbid += 5
        bidValue.text = "\(currbid)"
        money.text = "\(currmoney)" */
    }
    
    @IBAction func tenPressed(sender: AnyObject) {
        players[playingPlayer].money -= 10
        players[playingPlayer].hands.bet += 10
        self.bidValue.text = "\(players[playingPlayer].hands.bet)"
        self.money.text = "\(players[playingPlayer].money)"
    }
    
    @IBAction func dealPressed(sender: AnyObject) {
        standButton.enabled = true
        hitButton.enabled = true
        for j in 1...2{
            var a = shoe.removeLast()
            players[playingPlayer].hands.cards.append(a)
            println("\(players[playingPlayer].hands.score)")
            self.playerCards.text = ("\(playerCards.text)\n\(a.rank.values.r)\(a.suite.rawValue)")
            playerString = "\(playerCards.text)\n\(a.rank.values.r)\(a.suite.rawValue)"
        }
            let b = shoe.removeLast()
            dealer.hands.cards.append(b)
            dealerString = "\(dealerCards.text)\n\(b.rank.values.r)\(b.suite.rawValue)"
            self.dealerCards.text = ("\(dealerCards.text)\n\(b.rank.values.r)\(b.suite.rawValue)")
          //  dealer.hands.score
            c.append(shoe.removeLast())
        
    }
    
    
    
    @IBAction func standPressed(sender: AnyObject) {
        var d = c.removeLast()
        dealer.hands.cards.append(d)
        self.dealerCards.text = ("\(dealerCards.text)\n\(d.rank.values.r)\(d.suite.rawValue)")
        dealerString = "\(dealerCards.text)\n\(d.rank.values.r)\(d.suite.rawValue)"
        dealerPick()
        win()
    }
    
    @IBAction func hitPressed(sender: AnyObject) {
    //      var a = shoe.removeLast()
            var a = shoe.removeLast()
            players[playingPlayer].hands.cards.append(a)
    /*        if players[playingPlayer].hands.score > 21 {
                for card in players[playingPlayer].hands.cards{
                    if card.rank.values.r == "A"{
                        card.rank.values.second
                    }
                }
            }*/
            println("\(players[playingPlayer].hands.score)")
            self.playerCards.text = ("\(playerCards.text)\n\(a.rank.values.r)\(a.suite.rawValue)")
            if players[playingPlayer].hands.score > 21 {
                playerString = ("\(playerCards.text)")
                win()

            }
     //       println("\(players[playingPlayer].hands.score)")
        
        
    }

    
    @IBAction func newGamePressed(sender: AnyObject) {
    }
    
 /*   func playerBusted(){
        var alert = UIAlertController(title: "Busted", message: "Player \(players[playingPlayer].name) Busted\n\(playerString)\nDealer:\(dealerString)", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Next", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
      //  let pcards = players[playingPlayer].hands.cards
        players[playingPlayer].money -= players[playingPlayer].hands.bet
        newd()
      //  abc()
     //   self.playerCards.text = (" ")
      //  self.dealerCards.text = (" ")
    } */
    
    func dealerPick() {
        if dealer.hands.score < 16{
            var d = shoe.removeLast()

            dealer.hands.cards.append(d)
            self.dealerCards.text = ("\(dealerCards.text)\n\(d.rank.values.r)\(d.suite.rawValue)")
            dealerString = "\(dealerCards.text)\n\(d.rank.values.r)\(d.suite.rawValue)"
            if dealer.hands.score > 21{
                //dealerBusted()
                
            }
            dealerPick()
        }
    }
    
/*    func dealerBusted(){
        var alert = UIAlertController(title: "Dealer Busted", message: "Player \(players[playingPlayer].name) Wins\n\(playerString)\nDealer:\(dealerString)", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Next", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        //  let pcards = players[playingPlayer].hands.cards
        players[playingPlayer].money += players[playingPlayer].hands.bet
        newd()
     //   abc()
     //   self.playerCards.text = (" ")
      //  self.dealerCards.text = (" ")
    }*/

    
    func win() {
        if players[playingPlayer].hands.score > dealer.hands.score && (players[playingPlayer].hands.score < 21 || players[playingPlayer].hands.score == 21){
            var alert = UIAlertController(title: "Win", message: "Player \(players[playingPlayer].name) Wins\n\(playerString)\nDealer:\(dealerString)", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Next", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        } else if dealer.hands.score > players[playingPlayer].hands.score && (dealer.hands.score < 21 || dealer.hands.score == 21){
            var alert = UIAlertController(title: "Unlucky!!", message: "Player \(players[playingPlayer].name) lose\n\(playerString)\nDealer:\(dealerString)", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Next", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }  else if dealer.hands.score == players[playingPlayer].hands.score {
            var alert = UIAlertController(title: "Push", message: "\(playerString)\nDealer:\(dealerString)", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Next", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        } else if dealer.hands.score > 21 {
            var alert = UIAlertController(title: "Dealer Busted", message: "Player \(players[playingPlayer].name) Wins\n\(playerString)\nDealer:\(dealerString)", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Next", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            //  let pcards = players[playingPlayer].hands.cards
            players[playingPlayer].money += players[playingPlayer].hands.bet
        } else if players[playingPlayer].hands.score > 21{
            var alert = UIAlertController(title: "Busted", message: "Player \(players[playingPlayer].name) Busted\n\(playerString)\nDealer:\(dealerString)\n\(my)", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Next", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            //  let pcards = players[playingPlayer].hands.cards
            players[playingPlayer].money -= players[playingPlayer].hands.bet
        }
        
        newd()
      //  abc()
    }
    
    func abc(){
        self.playerCards.text = (" ")
        self.dealerCards.text = (" ")
        
    }
    
    func newd() {
        standButton.enabled = false
        hitButton.enabled = false
        abc()
        players[playingPlayer].hands.bet = 0
        players[playingPlayer].hands.cards = []
        //    players[playingPlayer].hands.score
        dealer.hands.cards = []
        playingPlayer++
        println("\(playingPlayer)")
        if playingPlayer < nofplayers {
            self.playerNumberLabel.text = "\(players[playingPlayer].name)"
            self.money.text = "\(players[playingPlayer].money)"
            self.bidValue.text = "\(players[playingPlayer].hands.bet)"
        } else {
            playingPlayer = 0
            roundCounter++
            self.roundNumber.text = "\(roundCounter)"
            if roundCounter > 5{
                roundCounter = 1
                self.roundNumber.text = "\(roundCounter)"
                shoe = Deck().shuffle(shoe)
            }
            self.playerNumberLabel.text = "\(players[playingPlayer].name)"
            self.money.text = "\(players[playingPlayer].money)"
            self.bidValue.text = "\(players[playingPlayer].hands.bet)"
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
