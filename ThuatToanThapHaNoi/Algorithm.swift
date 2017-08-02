//
//  Algorithm.swift
//  ThuatToanThapHaNoi
//
//  Created by ThietTB on 8/2/17.
//  Copyright © 2017 bipbipdinang. All rights reserved.
//

import Foundation
// Move :là lớp thực thi hành động di chuyển đĩa
struct Move{
    
    var fromPeg: Tower
    var toPeg: Tower
    
    var description: String {
        return "\(fromPeg.name) -> \(toPeg.name)"
    }
    
    init(fromPeg: Tower, toPeg: Tower) {
        self.fromPeg = fromPeg
        self.toPeg = toPeg
    }
    
    func execute() -> Disk {
        let disk = fromPeg.removeTopDisk()
        toPeg.addDisk(disk: disk)
        return disk
    }
}
class HanoiAlgorithm {
    // Di chuyển từ Tháp này đến Tháp kia và 1 biến count để xác định số lượng đĩa
    
    func moveNumberOfDisks(count: Int, fromPeg: Tower, toPeg: Tower, otherPeg: Tower) -> [Move] {
        
        var moves = Array<Move>()
        
        if count == 1{
            moves.append(Move(fromPeg: fromPeg, toPeg: toPeg))
        }
            
        else
        {
            moves += moveNumberOfDisks(count: count - 1,
                                       fromPeg:  fromPeg,
                                       toPeg:    otherPeg,
                                       otherPeg: toPeg)
            
            moves += moveNumberOfDisks(count: 1, fromPeg: fromPeg, toPeg: toPeg, otherPeg: otherPeg)
            
            
            moves += moveNumberOfDisks(count: count - 1,
                                       fromPeg:  otherPeg,
                                       toPeg:    toPeg,
                                       otherPeg: fromPeg)
        }
        return moves;
    }
    
    func moveAllDisksFromPeg(fromPeg: Tower, toPeg: Tower, otherPeg: Tower) -> [Move] {
        return moveNumberOfDisks(count: fromPeg.diskCount,
                                 fromPeg:  fromPeg,
                                 toPeg:    toPeg,
                                 otherPeg: otherPeg)
    }
}
