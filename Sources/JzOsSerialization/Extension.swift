//
//  File.swift
//  
//
//  Created by Jianzhi.wang on 2020/11/2.
//

import Foundation
public extension Encodable {
    //儲存序列化物件
     func storeObject(name: String, rout: String = "file")->Bool{
        SqlClass.getControlInstance().createRout(rout: rout)
        let encoder: JSONEncoder = JSONEncoder()
        let encoded = try! encoder.encode(self).base64EncodedString(options:NSData.Base64EncodingOptions.init(rawValue: 0))
        SqlClass.getControlInstance().item_File.exSql("insert or replace into \(rout) (name,data) values ('\(name)','\(encoded)')")
        return true
    }
}
public  extension String{
    //取得序列化物件
     func getObject<T:Codable>(rout: String = "file")->T?{
        var data=""
        let decoder: JSONDecoder = JSONDecoder()
        SqlClass.getControlInstance().item_File.query("select data from \(rout) where name='\(self)'", {it in
            data=it.getString(0)
        }, {})
       
        let decodedData = Data(base64Encoded: data, options:NSData.Base64DecodingOptions.init(rawValue: 0))
        if(decodedData==nil){return nil}
        let decoded = try? decoder.decode(T.self, from: decodedData!)
        return decoded
    }
    //刪除序列化物件
      func deleteObject(rout:String = "file")->Bool{
        SqlClass.getControlInstance().item_File.exSql("delete from \(rout) where name='\(self)'")
        return true
    }
    //列出此路徑序列化物件
     func listObject(limit: Int = 0)-> [JsonObject] {
        var listJson = [JsonObject]()
        SqlClass.getControlInstance().item_File.query("select * from \(self) \((limit == 0) ? "" : "limit 0,\(limit)")", {
            it in
            listJson.append(JsonObject(name: it.getString(0),json: it.getString(1)))
        }, {})
        return listJson
    }
    //清空此路徑序列化物件
    func deleteSerialRout()->Bool{
        SqlClass.getControlInstance().item_File.exSql("DROP TABLE \(self)")
        return true
    }
}
public class JsonObject {
    public var name=""
    public var json=""
    init( name: String,  json: String) {
        self.name=name
        self.json=json
    }
    public func getObject<T: Codable>() -> T? {
      let decoder: JSONDecoder = JSONDecoder()
        let decodedData = Data(base64Encoded: json.data(using: .utf8)!, options:NSData.Base64DecodingOptions.init(rawValue: 0))
        if(decodedData==nil){return nil}
        return  try? decoder.decode(T.self, from: decodedData!)
    }
}
