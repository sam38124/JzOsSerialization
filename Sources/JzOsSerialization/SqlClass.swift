//
//  File.swift
//  
//
//  Created by Jianzhi.wang on 2020/11/2.
//

import Foundation
import JzOsSqlHelper
import Foundation
class SqlClass  {
    var item_File=SqlHelper("JzutilFiles.db")
    static var instanc:SqlClass? = nil
    public static func getControlInstance()->SqlClass{
        if(instanc == nil){
            instanc = SqlClass()
        }
        return instanc!
    }
    init (){
        item_File.autoCreat()
    }
    public func createRout(rout:String){
        item_File.exSql("CREATE TABLE IF NOT EXISTS `\(rout)` (\n" +
                "    name VARCHAR PRIMARY KEY,\n" +
                "    data      VARCHAR\n" +
                ");\n")
    }
}
