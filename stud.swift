//
//  stud.swift
//  coredatayash
//
//  Created by bmiit on 19/03/24.
//

import Foundation

class stud {
    var sid:Int
    var sname:String
    var age:Int

    init(sid:Int, sname:String, age:Int) {
        self.sid = sid
        self.sname = sname
        self.age = age
    }

    func printvalues() {
        print("\tNum1: ",sid)
        print("\tNum1: ",sname)
        print("\tNum1: ",age)
    
    }
}
