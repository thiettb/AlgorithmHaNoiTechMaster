//
//  Tower.swift
//  ThuatToanThapHaNoi
//
//  Created by ThietTB on 8/2/17.
//  Copyright © 2017 bipbipdinang. All rights reserved.
//

import Foundation
import UIKit
class Tower{ // Tháp
    var name: String
    
    // Disks on peg, ordered from bottom to top
    var disks: [Disk]
    
    var diskCount: Int { return disks.count }
    
    var description: String {
        let diskNames = disks.map { $0.diameter }
        
        return "\(name): \(diskNames)"
    }
    
    init(name: String, disks: [Disk]) {
        self.name = name
        self.disks = disks
    }
    
    convenience init(name: String) {
        self.init(name: name, disks: Array<Disk>())
    }
    
    func addDisk(disk: Disk) {
        disks.append(disk)
    }
    
    func getTopDisk() -> Disk{
        return disks.popLast()!
    }
    func removeTopDisk() -> Disk {
        return disks.removeLast()
    }
}
