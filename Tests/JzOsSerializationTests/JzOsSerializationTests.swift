import XCTest
@testable import JzOsSerialization

final class JzOsSerializationTests: XCTestCase {
    // 透過遵從 Codable 的協議，該 struct 即可被 Encodable 或 Decodable
   public struct Device: Codable {
        var deviceType: String
        var deviceSize: Float
        var deviceVersion: String
    }

    let device: Device = Device(deviceType: "iPhone 6s", deviceSize: 4.7, deviceVersion: "11.0.0")
    let encoder: JSONEncoder = JSONEncoder()
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
//        XCTAssertEqual(JzOsUtil().text, "Hello, World!")
        device.storeObject(name: "test")
        let a:JzOsSerializationTests.Device? = "test".getObject()
        print( a!.deviceType)
        print( a!.deviceSize)
        print( a!.deviceVersion)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
