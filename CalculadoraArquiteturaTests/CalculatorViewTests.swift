//
//  CalculatorViewTests.swift
//  CalculadoraArquiteturaTests
//
//  Created by Caroline Taus on 10/01/22.
//

import Foundation
@testable import CalculadoraArquitetura
import SnapshotTesting
import XCTest

class CalculatorViewTests: XCTestCase {

    var sut: ViewController!

    override func setUp() {
        sut = ViewController()
        isRecording = false
    }

    override func tearDown() {
        sut = nil
    }

    func testViewLayout() {
        assertSnapshot(matching: sut, as: .image)
    }
}
