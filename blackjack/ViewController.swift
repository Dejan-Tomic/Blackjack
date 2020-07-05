//
//  ViewController.swift
//  blackjack
//
//  Created by Dejan Tomic on 25/03/2020.
//  Copyright © 2020 Dejan Tomic. All rights reserved.
//

import UIKit
import AVKit

var twistCount = 0
var cardValue = 0
var totalDealerCardValue = 0
var totalPlayerCardValue = 0
var betPlaced = 0
var purse = 100
let savedScore = UserDefaults.standard
var greenChipValue = 100
var blueChipValue = 50
var redChipValue = 10

let cardImageArray = [UIImage(named: "AC.png")!, UIImage(named: "2C.png")!, UIImage(named: "3C.png")!, UIImage(named: "4C.png")!, UIImage(named: "5C.png")!, UIImage(named: "6C.png")!, UIImage(named: "7C.png")!, UIImage(named: "8C.png")!, UIImage(named: "9C.png")!,UIImage(named: "JC.png")!, UIImage(named: "QC.png")!, UIImage(named: "KC.png")!, UIImage(named: "AD.png")!
, UIImage(named: "2D.png")!
, UIImage(named: "3D.png")!, UIImage(named: "4D.png")!, UIImage(named: "5D.png")!, UIImage(named: "6D.png")!, UIImage(named: "7D.png")!, UIImage(named: "8D.png")!, UIImage(named: "9D.png")!, UIImage(named: "JD.png")!, UIImage(named: "QD.png")!, UIImage(named: "KD.png")!, UIImage(named: "AH.png")!, UIImage(named: "2H.png")!, UIImage(named: "3H.png")!, UIImage(named: "4H.png")!, UIImage(named: "5H.png")!, UIImage(named: "6H.png")!, UIImage(named: "7H.png")!, UIImage(named: "8H.png")!, UIImage(named: "9H.png")!, UIImage(named: "JH.png")!, UIImage(named: "QH.png")!, UIImage(named: "KH.png")!, UIImage(named: "AS.png")!, UIImage(named: "2S.png")!, UIImage(named: "3S.png")!, UIImage(named: "4S.png")!, UIImage(named: "5S.png")!, UIImage(named: "6S.png")!, UIImage(named: "7S.png")!, UIImage(named: "8S.png")!, UIImage(named: "9S.png")!, UIImage(named: "JS.png")!, UIImage(named: "QS.png")!, UIImage(named: "KS.png")!]

class ViewController: UIViewController {
    
    @IBOutlet weak var dealerCard1: UIImageView!
    @IBOutlet weak var dealerCard2: UIImageView!
    @IBOutlet weak var dealerCard3: UIImageView!
    @IBOutlet weak var dealerCard4: UIImageView!
    @IBOutlet weak var dealerTotal: UILabel!
    @IBOutlet weak var gameOverMessage: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var playerCard1: UIImageView!
    @IBOutlet weak var playerCard2: UIImageView!
    @IBOutlet weak var playerCard3: UIImageView!
    @IBOutlet weak var playerCard4: UIImageView!
    @IBOutlet weak var playerTotal: UILabel!
    @IBOutlet weak var twistButton: UIButton!
    @IBOutlet weak var stickButton: UIButton!
    @IBOutlet weak var opponent: UIImageView!
    @IBOutlet weak var dealer: UIImageView!
    @IBOutlet weak var betPlacedLabel: UILabel!
    @IBOutlet weak var purseLabel: UILabel!
    @IBOutlet weak var greenChip: UIButton!
    @IBOutlet weak var blueChip: UIButton!
    @IBOutlet weak var redChip: UIButton!
    @IBOutlet weak var acesHighOrLowCard1: UISegmentedControl!
    @IBOutlet weak var acesHighOrLowCard2: UISegmentedControl!
    @IBOutlet weak var acesHighOrLowCard3: UISegmentedControl!
    @IBOutlet weak var acesHighOrLowCard4: UISegmentedControl!
    
    @IBOutlet weak var greenChipValueLabel: UILabel!
    @IBOutlet weak var blueChipValueLabel: UILabel!
    @IBOutlet weak var redChipValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        twistButton.layer.cornerRadius = 10
        stickButton.layer.cornerRadius = 10
        newGame()
        playerCardsColour()
        
    }

    
    @IBAction func twist(_ sender: UIButton) {
        twistCount += 1
        
        switch twistCount {
        case 1:
            if totalDealerCardValue < 17 {
                dealerCard3.image = cardImageArray.randomElement()
                totalDealerCardValue += currentCardValue(card: dealerCard3)
                dealerTotal.text = "\(totalDealerCardValue)"
                
                } else {
                dealerSticking()
             }
                
                playerCard3.image = cardImageArray.randomElement()
                totalPlayerCardValue += currentCardValue(card: playerCard3)
                playerTotal.text = "\(totalPlayerCardValue)"
            
        if playerCard3.image != UIImage(named: "AC.png") && playerCard3.image != UIImage(named: "AD.png") && playerCard3.image != UIImage(named: "AH.png") && playerCard3.image != UIImage(named: "AS.png"){
                acesHighOrLowCard3.isHidden = true
        } else {
                acesHighOrLowCard3.isHidden = false
            
            }

        case 2:
             if totalDealerCardValue < 17 {
                dealerCard1.image = cardImageArray.randomElement()
                totalDealerCardValue += currentCardValue(card: dealerCard1)
                dealerTotal.text = "\(totalDealerCardValue)"
            
                } else {
                dealerSticking()
              }
                
                playerCard1.image = cardImageArray.randomElement()
                totalPlayerCardValue += currentCardValue(card: playerCard1)
                playerTotal.text = "\(totalPlayerCardValue)"
                dealerCard1.isHidden = false
                playerCard1.isHidden = false
            
            if playerCard1.image != UIImage(named: "AC.png") && playerCard1.image != UIImage(named: "AD.png") && playerCard1.image != UIImage(named: "AH.png") && playerCard1.image != UIImage(named: "AS.png"){
                           acesHighOrLowCard1.isHidden = true
                   } else {
                           acesHighOrLowCard1.isHidden = false
                       }

        case 3:
             if totalDealerCardValue < 17 {
                dealerCard4.image = cardImageArray.randomElement()
                totalDealerCardValue += currentCardValue(card: dealerCard4)
                dealerTotal.text = "\(totalDealerCardValue)"
            
                } else {
                dealerSticking()
             }
            
                playerCard4.image = cardImageArray.randomElement()
                totalPlayerCardValue += currentCardValue(card: playerCard4)
                playerTotal.text = "\(totalPlayerCardValue)"
        
                dealerCard4.isHidden = false
                playerCard4.isHidden = false
                twistButton.isEnabled = false
            
            if playerCard4.image != UIImage(named: "AC.png") && playerCard4.image != UIImage(named: "AD.png") && playerCard4.image != UIImage(named: "AH.png") && playerCard4.image != UIImage(named: "AS.png"){
                    acesHighOrLowCard4.isHidden = true
            } else {
                    acesHighOrLowCard4.isHidden = false
                }
            
        default: print("Nothing to see here")
            }
        }
    
    
    @IBAction func stickButtonPressed(_ sender: Any) {
        let valuePlayerIsBelow21 = 21 - totalPlayerCardValue
        let valueDealerIsBelow21 = 21 - totalDealerCardValue
        
        let valuePlayerIsAbove21 = totalPlayerCardValue - 21
        let valueDealerisAbove21 = totalDealerCardValue - 21
        
        
        if totalDealerCardValue == 21 {
            youlose()
            purse -= betPlaced
            purseLabel.text = "\(purse)"
        
            
        } else if totalPlayerCardValue == 21 && totalDealerCardValue != 21 {
            youwin()
            
        } else if totalPlayerCardValue < 21 && totalDealerCardValue > 21 {
            youwin()
            
        } else if totalPlayerCardValue > 21 && totalDealerCardValue < 21 {
            youlose()
            
        } else  if totalPlayerCardValue < 21 && totalDealerCardValue < 21 && valuePlayerIsBelow21 < valueDealerIsBelow21 {
            youwin()
            
        } else if totalPlayerCardValue > 21 && totalDealerCardValue > 21 && valuePlayerIsAbove21 < valueDealerisAbove21 {
            youwin()

        } else {
            youlose()

        }
        
        dealerTotal.isHidden = false
        gameOverMessage.isHidden = false
        playAgainButton.isHidden = false
        twistButton.isHidden = true
        stickButton.isHidden = true
        dealer.isHidden = false
        opponent.isHidden = true
        chipsHideShow(Hidden: true)
        savedScore.set(purse, forKey: "savedScore")
        acesHighOrLowHidden(Hidden: true)
    }
    
    
    @IBAction func playAgainButtonPressed(_ sender: Any) {
        newGame()
        chipsHideShow(Hidden: false)
        playerCardsColour()
    }
    
    func youlose() {
        gameOverMessage.text = " You lose!"
        gameOverMessage.backgroundColor = .systemRed
        purse -= betPlaced
        purseLabel.text = "$\(purse)"
    }
    
    func youwin() {
        gameOverMessage.text = " You win!"
        gameOverMessage.backgroundColor = .systemGreen
        purse += (betPlaced * 2)
        purseLabel.text = "$\(purse)"
    }
    
    func newGame() {
        playerCardsColour()
        setChipValues()
        dealerTotal.isHidden = true
        playAgainButton.isHidden = true
        gameOverMessage.isHidden = true
        dealerCard1.isHidden = true
        dealerCard4.isHidden = true
        playerCard1.isHidden = true
        playerCard4.isHidden = true
              
        dealerCard2.image = cardImageArray.randomElement()
        totalDealerCardValue = currentCardValue(card: dealerCard2)
        dealerTotal.text = "\(totalDealerCardValue)"
        playerCard2.image = cardImageArray.randomElement()
        
        if playerCard2.image != UIImage(named: "AC.png") && playerCard2.image != UIImage(named: "AD.png") && playerCard2.image != UIImage(named: "AH.png") && playerCard2.image != UIImage(named: "AS.png"){
                acesHighOrLowCard2.isHidden = true
        } else {
                acesHighOrLowCard2.isHidden = false
            }
        
        totalPlayerCardValue = currentCardValue(card: playerCard2)
        playerTotal.text = "\(totalPlayerCardValue)"
        twistCount = 0
        dealerCard3.image = UIImage(named: "black_back")
        playerCard3.image = UIImage(named: "red_back")
        twistButton.isHidden = false
        twistButton.isEnabled = true
        stickButton.isHidden = false
        dealer.isHidden = true
        opponent.isHidden = false
        acesHighOrLowHidden(Hidden: true)
        betPlaced = 0
        betPlacedLabel.text = "$\(betPlaced)"
        purse = savedScore.integer(forKey: "savedScore")
        purseLabel.text = "$\(purse)"
    }
    
    
    
    @IBAction func greenChipPressed(_ sender: Any) {
        if betPlaced <= purse {
                           if betPlaced == purse {
                               maxOutPurse(lastBet: greenChipValue)
                               } else {
                   
                               betPlaced += greenChipValue
                               purse -= greenChipValue

                               betPlacedLabel.text = "$\(betPlaced)"
                               purseLabel.text = "$\(purse)"
                               }
                   
               } else {
                   purseMaxedOut()
               }    }
    
    

    @IBAction func blueChipPressed(_ sender: Any) {
       
        if betPlaced <= purse {
                    if betPlaced == purse {
                        print("Are you sure you want to bet it all?")
                        maxOutPurse(lastBet: blueChipValue)
                        } else {
            
                        betPlaced += blueChipValue
                        purse -= blueChipValue

                        betPlacedLabel.text = "$\(betPlaced)"
                        purseLabel.text = "$\(purse)"
                        }
            
        } else {
            purseMaxedOut()
        }

    }
    
     
    @IBAction func redChipPressed(_ sender: Any) {
   
          if betPlaced <= purse {
                      if betPlaced == purse {
                          print("Are you sure you want to bet it all?")
                          maxOutPurse(lastBet: redChipValue)
                          } else {
              
                          betPlaced += redChipValue
                          purse -= redChipValue

                          betPlacedLabel.text = "$\(betPlaced)"
                          purseLabel.text = "$\(purse)"
                          }
          } else {
              purseMaxedOut()
          }

    }
    
    @IBAction func resetPurse(_ sender: Any) {
        purse = 100
        savedScore.set(purse, forKey: "savedScore")
        purseLabel.text = "$\(purse)"
        playerCardsColour()
        
    }
    
    func dealerSticking() {
    let alert = UIAlertController(title: "Opponent", message: "I'll stick thanks.", preferredStyle: .alert)

    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
    self.present(alert, animated: true)
    }
    
    
    func purseMaxedOut() {
    let alert = UIAlertController(title: "Purse maxed out", message: "You cannot bet more than you have", preferredStyle: .alert)

    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
    self.present(alert, animated: true)
    }
    
    
    func maxOutPurse(lastBet: Int) {
        
        let alert = UIAlertController(title: "Purse maxed out", message: "Are you sure you want to bet all you have?", preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: {
            action in betPlaced -= lastBet
            self.betPlacedLabel.text = "$\(betPlaced)"
        } ))
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {
            action in betPlaced += lastBet
            self.betPlacedLabel.text = "$\(betPlaced)"
            purse -= lastBet
            self.purseLabel.text = "$\(purse)"
        }))
        self.present(alert, animated: true)
    }
    
    
    @IBAction func acesHighOrLowCard1Switch(_ sender: Any) {

        if acesHighOrLowCard1.selectedSegmentIndex == 0 {
            totalPlayerCardValue -= 10
            playerTotal.text = "\(totalPlayerCardValue)"
        } else {
            totalPlayerCardValue += 10
            playerTotal.text = "\(totalPlayerCardValue)"
        }
    }
    

    
    @IBAction func acesHighOrLowCard2Switch(_ sender: Any) {
        if acesHighOrLowCard2.selectedSegmentIndex == 0 {
            totalPlayerCardValue -= 10
            playerTotal.text = "\(totalPlayerCardValue)"
        } else {
            totalPlayerCardValue += 10
            playerTotal.text = "\(totalPlayerCardValue)"
        }
    }
    
    
    
    @IBAction func acesHighOrLowCard3Switch(_ sender: Any) {
        if acesHighOrLowCard3.selectedSegmentIndex == 0 {
            totalPlayerCardValue -= 10
            playerTotal.text = "\(totalPlayerCardValue)"
        } else {
            totalPlayerCardValue += 10
            playerTotal.text = "\(totalPlayerCardValue)"
        }
    }
    
    
    @IBAction func acesHighOrLowCard4Switch(_ sender: Any) {
        if acesHighOrLowCard4.selectedSegmentIndex == 0 {
            totalPlayerCardValue -= 10
            playerTotal.text = "\(totalPlayerCardValue)"
        } else {
            totalPlayerCardValue += 10
            playerTotal.text = "\(totalPlayerCardValue)"
        }
    }
    
    func currentCardValue(card: UIImageView) -> Int {
        
        switch card.image {
              // Clubs cards
              case UIImage(named: "AC.png")!: cardValue = 1
              case UIImage(named: "2C.png")!: cardValue = 2
              case UIImage(named: "3C.png")!: cardValue = 3
              case UIImage(named: "4C.png")!: cardValue = 4
              case UIImage(named: "5C.png")!: cardValue = 5
              case UIImage(named: "6C.png")!: cardValue = 6
              case UIImage(named: "7C.png")!: cardValue = 7
              case UIImage(named: "8C.png")!: cardValue = 8
              case UIImage(named: "9C.png")!: cardValue = 9
              case UIImage(named: "JC.png")!: cardValue = 10
              case UIImage(named: "QC.png")!: cardValue = 10
              case UIImage(named: "KC.png")!: cardValue = 10
             
             // Diamonds cards
             case UIImage(named: "AD.png")!: cardValue = 1
             case UIImage(named: "2D.png")!: cardValue = 2
             case UIImage(named: "3D.png")!: cardValue = 3
             case UIImage(named: "4D.png")!: cardValue = 4
             case UIImage(named: "5D.png")!: cardValue = 5
             case UIImage(named: "6D.png")!: cardValue = 6
             case UIImage(named: "7D.png")!: cardValue = 7
             case UIImage(named: "8D.png")!: cardValue = 8
             case UIImage(named: "9D.png")!: cardValue = 9
             case UIImage(named: "JD.png")!: cardValue = 10
             case UIImage(named: "QD.png")!: cardValue = 10
             case UIImage(named: "KD.png")!: cardValue = 10
             
             // Hearts cards
             case UIImage(named: "AH.png")!: cardValue = 1
             case UIImage(named: "2H.png")!: cardValue = 2
             case UIImage(named: "3H.png")!: cardValue = 3
             case UIImage(named: "4H.png")!: cardValue = 4
             case UIImage(named: "5H.png")!: cardValue = 5
             case UIImage(named: "6H.png")!: cardValue = 6
             case UIImage(named: "7H.png")!: cardValue = 7
             case UIImage(named: "8H.png")!: cardValue = 8
             case UIImage(named: "9H.png")!: cardValue = 9
             case UIImage(named: "JH.png")!: cardValue = 10
             case UIImage(named: "QH.png")!: cardValue = 10
             case UIImage(named: "KH.png")!: cardValue = 10
             
             // Spades cards
             case UIImage(named: "AS.png")!: cardValue = 1
             case UIImage(named: "2S.png")!: cardValue = 2
             case UIImage(named: "3S.png")!: cardValue = 3
             case UIImage(named: "4S.png")!: cardValue = 4
             case UIImage(named: "5S.png")!: cardValue = 5
             case UIImage(named: "6S.png")!: cardValue = 6
             case UIImage(named: "7S.png")!: cardValue = 7
             case UIImage(named: "8S.png")!: cardValue = 8
             case UIImage(named: "9S.png")!: cardValue = 9
             case UIImage(named: "JS.png")!: cardValue = 10
             case UIImage(named: "QS.png")!: cardValue = 10
             case UIImage(named: "KS.png")!: cardValue = 10
             
             default: cardValue = 0
             }
        
        return cardValue
    }
    
    func chipsHideShow(Hidden: Bool) {
        greenChip.isHidden = Hidden
        blueChip.isHidden = Hidden
        redChip.isHidden = Hidden
    }
    
    func acesHighOrLowHidden(Hidden: Bool) {
        acesHighOrLowCard1.isHidden = Hidden
        acesHighOrLowCard2.isHidden = Hidden
        acesHighOrLowCard3.isHidden = Hidden
        acesHighOrLowCard4.isHidden = Hidden
    }
    
    
    func setChipValues() {
        
        if purse < 10000 {
            greenChipValue = 100
            blueChipValue = 50
            redChipValue = 10
            
            greenChipValueLabel.text = "100"
            blueChipValueLabel.text = "50"
            redChipValueLabel.text = "10"
            
        } else if purse < 1000000 {
            newCoinValuesAlert(message: "Now you're getting good at this we've upped the stakes.")
            greenChipValue = 1000
            blueChipValue = 500
            redChipValue = 100
            
            greenChipValueLabel.text = "1000"
            blueChipValueLabel.text = "500"
            redChipValueLabel.text = "100"
            
        } else {
            newCoinValuesAlert(message: "Welcome to the high rollers table, kid!")
            greenChipValue = 100000
            blueChipValue = 50000
            redChipValue = 1000
            
            greenChipValueLabel.text = "100k"
            blueChipValueLabel.text = "50k"
            redChipValueLabel.text = "10k"
        }
    }
        
        func playerCardsColour() {
            var deckColour: String
            
            if purse < 10000 {
                deckColour = "red"

            } else if purse < 250000 {
                deckColour = "blue"

            } else if purse < 500000  {
                deckColour = "purple"

            } else {
              deckColour = "yellow"
            }
       
            playerCard1.image = UIImage(named: "\(deckColour)_back")
            playerCard3.image = UIImage(named: "\(deckColour)_back")
            playerCard4.image = UIImage(named: "\(deckColour)_back")
        }
    
    
    func newCoinValuesAlert(message: String) {
        let alert = UIAlertController(title: "New chip values", message: "\(message)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    
}


 
