//
//  CalculadoraArquiteturaTests.swift
//  CalculadoraArquiteturaTests
//
//  Created by Caroline Taus on 06/01/22.
//

import XCTest
@testable import CalculadoraArquitetura

class ViewControllerTests: XCTestCase {
    var sut: ViewController! // system under test

    override func setUp() {
        sut = ViewController()
    }

    override func tearDown() {
        sut = nil
    }
    
    func testTapFirstNumber() { // tap first number
        sut.tapNumber(num: 5)
        XCTAssertEqual(sut.numA, 5)
    }
    
    func testTapMoreNumbers() {
        sut.tapNumber(num: 2)
        sut.tapNumber(num: 5)
        XCTAssertEqual(sut.numA, 25)
    }
    
    func testTapOp() {
        sut.tapNumber(num: 5)
        sut.tapOperation(op: "+")
        XCTAssertEqual(sut.oper, "+")
    }
    
    func testTapSecondNumber() { // tap second number when tapped first and op
        sut.tapNumber(num: 5)
        sut.tapOperation(op: "+")
        sut.tapNumber(num: 3)
        XCTAssertEqual(sut.numB, 3)
    }
    
    func testChangeOp() {
        sut.tapNumber(num: 5)
        sut.tapOperation(op: "+")
        sut.tapOperation(op: "-")
        XCTAssertEqual(sut.oper, "-")
    }
    
    func testClear() {
        sut.tapNumber(num: 5)
        sut.tapOperation(op: "+")
        sut.tapNumber(num: 3)
        sut.tapAC()
        XCTAssertEqual(sut.numA, nil)
        XCTAssertEqual(sut.numB, nil)
        XCTAssertEqual(sut.oper, nil)
        XCTAssertEqual(sut.opResult, nil)
    }
    
    func testSumOperation() {
        sut.tapNumber(num: 5)
        sut.tapOperation(op: "+")
        sut.tapNumber(num: 3)
        sut.tapOperation(op: "=")
        XCTAssertEqual(sut.opResult, "8")
    }
    
    func testSubOperation() {
        sut.tapNumber(num: 5)
        sut.tapOperation(op: "-")
        sut.tapNumber(num: 3)
        sut.tapOperation(op: "=")
        XCTAssertEqual(sut.opResult, "2")
    }
    
    func testNegativeResult() {
        sut.tapNumber(num: 3)
        sut.tapOperation(op: "-")
        sut.tapNumber(num: 5)
        sut.tapOperation(op: "=")
        XCTAssertEqual(sut.opResult, "-2")
    }
    
    func testMultOperation() {
        sut.tapNumber(num: 3)
        sut.tapOperation(op: "*")
        sut.tapNumber(num: 5)
        sut.tapOperation(op: "=")
        XCTAssertEqual(sut.opResult, "15")
    }
    
    func testDivOperation() {
        sut.tapNumber(num: 15)
        sut.tapOperation(op: "/")
        sut.tapNumber(num: 5)
        sut.tapOperation(op: "=")
        XCTAssertEqual(sut.opResult, "3")
    }
    
    func testZeroDivision() {
        sut.tapNumber(num: 5)
        sut.tapOperation(op: "/")
        sut.tapNumber(num: 0)
        sut.tapOperation(op: "=")
        XCTAssertEqual(sut.opResult, "ERRO")
    }
    
    // TODO: implementar a possibilidade de escrever numeros negativos
    func testNegativeFirstNumber() {
        sut.tapOperation(op: "-")
        sut.tapNumber(num: 2)
        XCTAssertEqual(sut.numA, -2)
    }
    
    
    
    


}
