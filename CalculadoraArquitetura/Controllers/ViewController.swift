//
//  ViewController.swift
//  CalculadoraArquitetura
//
//  Created by Caroline Taus on 06/01/22.
//

import UIKit

class ViewController: UIViewController {
    let titleLabel: UILabel = UILabel()
    let button1: UIButton = UIButton()
    var numButtons: [UIButton] = []
    var otherButtons: [UIButton] = []
    let otherButtonsTitle: [String] = ["=", "+", "-", "*", "/"]
    var numADisplay: UILabel = UILabel()
    var numBDisplay: UILabel = UILabel()
    var operationDisplay: UILabel = UILabel()
    var resultDisplay: UILabel = UILabel()
    var numA: Int?
    var numB: Int?
    var oper: String?
    var calc: CalculatorLogic = CalculatorLogic()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        
        
        // Botões Números
        for i in 0..<10 {
            self.numButtons.append(self.makeButton(title: "\(i)", color: .green))
            numButtons[i].translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(self.numButtons[i])
        }
        
        // Botões Outros
        for i in 0..<5 {
            self.otherButtons.append(self.makeButton(title: otherButtonsTitle[i], color: .magenta))
            otherButtons[i].translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(self.otherButtons[i])
            
        }
        
        // Label Calculadora
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Calculadora"
        titleLabel.textColor = .white
        titleLabel.font = titleLabel.font.withSize(25)
        view.addSubview(titleLabel)
        
        // Label Operation Display
        operationDisplay.translatesAutoresizingMaskIntoConstraints = false
        operationDisplay.text = "OP"
        operationDisplay.textColor = .white
        operationDisplay.font = operationDisplay.font.withSize(20)
        view.addSubview(operationDisplay)
        numADisplay.translatesAutoresizingMaskIntoConstraints = false
        numADisplay.text = "0"
        numADisplay.textColor = .white
        numADisplay.font = numADisplay.font.withSize(20)
        view.addSubview(numADisplay)
        numBDisplay.translatesAutoresizingMaskIntoConstraints = false
        numBDisplay.text = "B"
        numBDisplay.textColor = .white
        numBDisplay.font = numBDisplay.font.withSize(20)
        view.addSubview(numBDisplay)
        
        // Label Result Display
        resultDisplay.translatesAutoresizingMaskIntoConstraints = false
        resultDisplay.text = "Resultado"
        resultDisplay.textColor = .white
        resultDisplay.font = titleLabel.font.withSize(20)
        view.addSubview(resultDisplay)
        
        
        getConstraints()
        
        
    }
    
    func getConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            operationDisplay.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 70),
            operationDisplay.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            numADisplay.centerXAnchor.constraint(equalTo: operationDisplay.centerXAnchor,constant: -50),
            numADisplay.centerYAnchor.constraint(equalTo: operationDisplay.centerYAnchor),
            numBDisplay.centerXAnchor.constraint(equalTo: operationDisplay.centerXAnchor,constant: 50),
            numBDisplay.centerYAnchor.constraint(equalTo: operationDisplay.centerYAnchor),
            
            numButtons[8].centerXAnchor.constraint(equalTo: view.centerXAnchor),
            numButtons[8].centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            numButtons[7].centerXAnchor.constraint(equalTo: numButtons[8].centerXAnchor, constant: -50),
            numButtons[7].centerYAnchor.constraint(equalTo: numButtons[8].centerYAnchor),
            numButtons[9].centerXAnchor.constraint(equalTo: numButtons[8].centerXAnchor, constant: 50),
            numButtons[9].centerYAnchor.constraint(equalTo: numButtons[8].centerYAnchor),
            
            numButtons[5].centerXAnchor.constraint(equalTo: view.centerXAnchor),
            numButtons[5].centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            numButtons[4].centerXAnchor.constraint(equalTo: numButtons[5].centerXAnchor, constant: -50),
            numButtons[4].centerYAnchor.constraint(equalTo: numButtons[5].centerYAnchor),
            numButtons[6].centerXAnchor.constraint(equalTo: numButtons[5].centerXAnchor, constant: 50),
            numButtons[6].centerYAnchor.constraint(equalTo: numButtons[5].centerYAnchor),
            
            numButtons[2].centerXAnchor.constraint(equalTo: view.centerXAnchor),
            numButtons[2].centerYAnchor.constraint(equalTo: view.centerYAnchor),
            numButtons[1].centerXAnchor.constraint(equalTo: numButtons[2].centerXAnchor, constant: -50),
            numButtons[1].centerYAnchor.constraint(equalTo: numButtons[2].centerYAnchor),
            numButtons[3].centerXAnchor.constraint(equalTo: numButtons[2].centerXAnchor, constant: 50),
            numButtons[3].centerYAnchor.constraint(equalTo: numButtons[2].centerYAnchor),
            
            numButtons[0].centerXAnchor.constraint(equalTo: numButtons[1].centerXAnchor),
            numButtons[0].centerYAnchor.constraint(equalTo: numButtons[1].centerYAnchor,constant: 50),
            
            otherButtons[0].centerXAnchor.constraint(equalTo: numButtons[3].centerXAnchor),
            otherButtons[0].centerYAnchor.constraint(equalTo: numButtons[0].centerYAnchor),
            
            otherButtons[2].centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: -25),
            otherButtons[2].centerYAnchor.constraint(equalTo: otherButtons[0].centerYAnchor,constant: 100),
            otherButtons[1].centerXAnchor.constraint(equalTo: otherButtons[2].centerXAnchor, constant: -50),
            otherButtons[1].centerYAnchor.constraint(equalTo: otherButtons[2].centerYAnchor),
            otherButtons[3].centerXAnchor.constraint(equalTo: view.centerXAnchor,constant: 25),
            otherButtons[3].centerYAnchor.constraint(equalTo: otherButtons[2].centerYAnchor),
            otherButtons[4].centerXAnchor.constraint(equalTo: otherButtons[3].centerXAnchor, constant: 50),
            otherButtons[4].centerYAnchor.constraint(equalTo: otherButtons[2].centerYAnchor),
            
            resultDisplay.topAnchor.constraint(equalTo: otherButtons[4].topAnchor, constant: 70),
            resultDisplay.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }
    
    func makeButton(title: String, color: UIColor) -> UIButton {
        let but = UIButton(type: .system)
        but.setTitle(title, for: .normal)
        but.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        but.tintColor = .blue
        but.backgroundColor = color
        but.addAction(UIAction(handler: { [weak self] _ in
            self?.buttonAction(title: title)
        }), for: .touchUpInside)
        
        return but
    }
    
    func buttonAction(title: String) {
        
        print(title)
        if (title != "+" && title != "-" && title != "*" && title != "/" && title != "=") { // se for um num
            
            if let op = oper { // se ja tem algo em oper, é o segundo num
                
                if let B = numB { // se numB nao ta nil
                    numB = (numB ?? 0) * 10 + Int(title)!
                    numBDisplay.text = "\(numB ?? 0)"
                }
                else {
                    numB = Int(title)
                    numBDisplay.text = "\(numB ?? 0)"
                }
            }
            else { // se oper = nil, é o primeiro numero
                if let A = numA { // se numA nao ta nil
                    numA = numA!*10 + Int(title)!
                    numADisplay.text = "\(numA ?? 0)"
                }
                else {
                    numA = Int(title)
                    numADisplay.text = "\(numA ?? 0)"
                }
            }
        }
        
        else { // se for operaçao
            print("op")
            if (title != "=") {
                oper = title
            }
            
            operationDisplay.text = oper
            
            if (title == "=") {
                
                if (oper == "+") {
                    resultDisplay.text = "\(calc.sum(numA!, numB!))"
                    clean()
                }
                if (oper == "-") {
                    resultDisplay.text = "\(calc.sub(numA!, numB!))"
                    clean()
                }
                if (oper == "*") {
                    resultDisplay.text = "\(calc.mult(numA!, numB!))"
                    clean()
                }
                if (oper == "/") {
                    resultDisplay.text = "\(calc.div(numA!, numB!))"
                    clean()
                }
            }
        }
        
            
        }
        
    func clean() {
        numA = nil
        numB = nil
        oper = nil
        numADisplay.text = "numA"
        numBDisplay.text = "numB"
        operationDisplay.text = "OP"
    }

    
    
    
}

