//
//  ViewController.swift
//  JuegoAdivinaIOS
//
//  Created by Edgar Tinajero on 7/29/15.
//  Copyright (c) 2015 PV Comunicaciones S.A de C.V. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var digitos = 0, oculto = 0, minimo = 1, maximo = 1000, intentos = 1
    
    var num: Int {
        return display.text!.toInt() ?? 0
    }

    @IBOutlet weak var display: UITextField!
    
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        self.reset()
    }
    
    func reset() {
        digitos = 0
        intentos = 1
        minimo = 1
        maximo = 1000
        oculto = Int(arc4random_uniform(UInt32(maximo))) +
        minimo
    }

    @IBAction func appendDigit(sender: UIButton) {
        let digitKey = sender.currentTitle!
        if digitos == 0 {
            display.text = digitKey
        }else{
            display.text = display.text + digitKey
        }
        digitos++
    }
    @IBAction func enter() {
        switch num {
        case let n where n < oculto:
            minimo = n
        case let n where n > oculto:
            maximo = n
        default:
            break
        }
        
        if num == oculto {
            display.text = "Ganaste en \(intentos) intentos!"
            reset()
        } else if num > 0 {
            display.text = "Entre \(minimo) y \(maximo) (\(intentos) intentos)"
            intentos++
        }
        
//        display.text = num == oculto ? "Ganaste!" : "Entre \(minimo) y \(maximo)"
        
        digitos = 0
    }
}

