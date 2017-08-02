//
//  ViewController.swift
//  ThuatToanThapHaNoi
//
//  Created by ThietTB on 8/2/17.
//  Copyright © 2017 bipbipdinang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Khởi tạo đĩa với bán kình của nó
        let disks = [
            Disk(3),
            Disk(2),
            Disk(1)]
        // Khởi tạo tháp: trong đó tháp A chứa 3 đĩa
        let pegA = Tower(name: "A", disks: disks)
        let pegB = Tower(name: "B")
        let pegC = Tower(name: "C")
        print("Start:")
        print(pegA.description)
        print(pegB.description)
        print(pegC.description)
        print()
        
        
        let moves = HanoiAlgorithm().moveAllDisksFromPeg(fromPeg: pegA, toPeg: pegC, otherPeg: pegB)
        
        
        print("Number of moves: \(moves.count)")
        print("")
        for move in moves {
            print(move.description)
            print("Đĩa di chuyển là: \(move.execute().diameter)")
        }
        
        print("\nFinish:")
        print(pegA.description)
        print(pegB.description)
        print(pegC.description)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
}


