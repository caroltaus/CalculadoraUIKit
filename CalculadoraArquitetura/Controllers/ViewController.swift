//
//  ViewController.swift
//  CalculadoraArquitetura
//
//  Created by Caroline Taus on 06/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    var numA: Int? {
        didSet {
            contentView.numADisplay.text = "\(numA ?? 0)"
        }
    }
    var numB: Int?{
        didSet {
            contentView.numBDisplay.text = "\(numB ?? 0)"
        }
    }
    var oper: String?{
        didSet {
            contentView.operationDisplay.text = "\(oper ?? "OP")"
        }
    }
    var opResult: String?{
        didSet {
            contentView.resultDisplay.text = "\(opResult ?? "Resultado")"
        }
    }
    var calc: CalculatorLogic = CalculatorLogic()
    var contentView: CalculatorView = CalculatorView()
    
    override func loadView() {
        super.loadView()
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActions()
    }
    
    func tapNumber(num: Int) {
        if let op = oper { // se ja tem algo em oper, é o segundo num
            
            if let numB = numB { // se numB nao ta nil
                self.numB = numB*10 + num
            }
            else {
                self.numB = num
            }
        }
        else { // se oper = nil, é o primeiro numero
            if let numA = numA { // se numA nao ta nil
                self.numA = numA*10 + num
                
            }
            else {
                self.numA = num
                
            }
        }
    }
    
    func tapOperation(op: String) {
        if (op != "=") {
            oper = op
        }
        
        guard let numA = numA, let numB = numB else {
            return
        }

        if (op == "=") {
            
            if (oper == "+") {
//                contentView.resultDisplay.text = "\(calc.sum(numA, numB))"
                opResult = "\(calc.sum(numA, numB))"
                clean()
            }
            if (oper == "-") {
//                contentView.resultDisplay.text = "\(calc.sub(numA, numB))"
                opResult = "\(calc.sub(numA, numB))"
                clean()
            }
            if (oper == "*") {
//                contentView.resultDisplay.text = "\(calc.mult(numA, numB))"
                opResult = "\(calc.mult(numA, numB))"
                clean()
            }
            if (oper == "/") {
//                contentView.resultDisplay.text = "\(calc.div(numA, numB))"
                if numB == 0 {
                    opResult = "ERRO"
                }
                else {
                    opResult = "\(calc.div(numA, numB))"
                }
                
                clean()
            }
        }
    }
    
    private func setupActions() {
        // enumerated transforma em uma tupla (botao e o indice dele)
        contentView.numButtons.enumerated().forEach { [weak self] (index, button) in
            button.addAction(UIAction(handler: { _ in
                self?.tapNumber(num: index)
                
            }), for: .touchUpInside)
        }
        
        contentView.otherButtons.forEach { [weak self] button in
            button.addAction(UIAction(handler: { handler in
                self?.tapOperation(op: button.titleLabel?.text ?? "" )
                
            }), for: .touchUpInside)
        }
        
        contentView.buttonAC.addAction(UIAction(handler: { handler in
            self.tapAC()
            
        }), for: .touchUpInside)
    }
    
    func tapAC() {
        clean()
        opResult = nil
    }
    
    private func clean() {
        numA = nil
        numB = nil
        oper = nil
        
        contentView.numADisplay.text = "numA"
        contentView.numBDisplay.text = "numB"
        contentView.operationDisplay.text = "OP"
        
    }
}

