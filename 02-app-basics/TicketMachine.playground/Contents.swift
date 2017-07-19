
import Foundation


protocol Screen {
    func showHowManyTickets()
    func showPrice(price: Int)
    func showError(error: String)
    func showThankYou()
}

protocol CoinAcceptor {
    var locked: Bool { get set }
    var amount: Int { get }
    
    var coinInsertedBlock: ((Int) -> Void)? { get set }
    
    func releaseAllCoins()
    func acceptAllCoins()
    func releaseChange(change: Int) -> Bool
}

protocol Printer {
    var hasPaper: Bool { get }
    
    func printTicket() -> Bool
}

protocol Keyboard {
    var amountSelectedBlock: ((Int) -> Void)? { get set }
}




class DummyScreen: Screen {
    func showThankYou() {
        print("Screen: Thank you for purchasing tickets")
    }
    func showHowManyTickets() {
        print("Screen: How many tickets you want?")
    }
    func showPrice(price: Int) {
        print("Screen: You need to pay \(price)")
    }
    func showError(error: String) {
        print("Screen: Something is broken: \(error)")
    }
}

class SecondScreen: Screen {
    func showThankYou() {
        print("Second Screen: Thank you for purchasing tickets")
    }
    func showHowManyTickets() {
        print("Second Screen: How many tickets you want?")
    }
    func showPrice(price: Int) {
        print("Second Screen: You need to pay \(price)")
    }
    func showError(error: String) {
        print("Second Screen: Something is broken: \(error)")
    }
}


class PrinterWithPaper: Printer {
    var paperCount: Int
    
    var hasPaper: Bool {
        return paperCount > 0
    }
    
    init(paperCount: Int) {
        assert(paperCount >= 0, "I don't like you")
        
        self.paperCount = paperCount
    }
    
    func printTicket() -> Bool {
        guard hasPaper else {
            print("Printer: out of paper and attempting to print")
            return false
        }
        print("Printer: Printing ticket")
        paperCount -= 1
        return true
    }
}

class DumbKeyboard: Keyboard {
    var amountSelectedBlock: ((Int) -> Void)? = nil
}

class MyCoinAcceptor: CoinAcceptor {
    var locked: Bool = true {
        didSet {
            print("CoinAcceptor: Locked - change from \(oldValue) to \(locked)")
        }
    }
    var amount: Int = 0
    var total: Int = 0
    var coinInsertedBlock: ((Int) -> Void)? = nil
    
    func releaseAllCoins() {
        print("CoinAcceptor: Release all coins")
        amount = 0
    }
    
    func acceptAllCoins() {
        total += amount
        print("CoinAcceptor: Accept all coins (\(total))")
        amount = 0
    }
    
    func releaseChange(change: Int) -> Bool {
        guard change <= total else {
            print("CoinAcceptor: not enough change")
            return false
        }
        
        total -= change
        print("CoinAcceptor: change released (\(change))")
        return true
    }
    
    func insertCoins(coin: Int) {
        assert(coin>0, "You need to insert something")
        
        print("CoinAcceptor: Inserted \(coin)")
        self.amount += coin
        coinInsertedBlock?(self.amount)
    }
    
}



class TicketMachine {
    let screen: Screen
    var coinAcceptor: CoinAcceptor
    let printer: Printer
    var keyboard: Keyboard
    
    let pricePerTicket: Int = 10
    var numberOfTickets: Int = 0
    
    init(screen: Screen, coinAcceptor: CoinAcceptor, printer: Printer, keyboard: Keyboard) {
        self.screen = screen
        self.coinAcceptor = coinAcceptor
        self.printer = printer
        self.keyboard = keyboard
    }
    
    func run() {
        coinAcceptor.coinInsertedBlock = coinInserted
        keyboard.amountSelectedBlock = { amount in
            guard self.printer.hasPaper else {
                self.screen.showError(error: "Out of paper")
                return
            }
            
            self.numberOfTickets = amount
            self.screen.showPrice(price: self.numberOfTickets * self.pricePerTicket)
            self.coinAcceptor.locked = false
        }
        
        screen.showHowManyTickets()
    }
    
    func coinInserted(amount: Int) {
        guard amount >= self.numberOfTickets * self.pricePerTicket else {
            return
        }
        guard self.printer.hasPaper else {
            self.screen.showError(error: "Out of paper")
            self.coinAcceptor.releaseAllCoins()
            return
        }
        
        self.coinAcceptor.locked = true
        
        var printedTickets = 0
        for counter in 0..<self.numberOfTickets {
            guard self.printer.printTicket() else {
                self.screen.showError(error: "Out of paper")
                break
            }
            printedTickets+=1
        }
        
        self.coinAcceptor.acceptAllCoins()
        self.coinAcceptor.releaseChange(change: amount-printedTickets*pricePerTicket)
        
        self.screen.showThankYou()
    }
}

let screen = DummyScreen()
let coinAcceptor = MyCoinAcceptor()
let printer = PrinterWithPaper(paperCount: 10)
let keyboard = DumbKeyboard()

let machine = TicketMachine(screen: screen, coinAcceptor: coinAcceptor, printer: printer, keyboard: keyboard)
machine.run()

keyboard.amountSelectedBlock?(2)
coinAcceptor.insertCoins(coin: 5)
coinAcceptor.insertCoins(coin: 10)
coinAcceptor.insertCoins(coin: 10)

