import XCTest
@testable import JzOsSerialization

final class JzOsSerializationTests: XCTestCase {
    // Need extend Codable
   public struct Device: Codable {
        var deviceType: String
        var deviceSize: Float
        var deviceVersion: String
    }
    func testExample() {
        //Store the object and give name
        Device(deviceType: "iPhone 6s", deviceSize: 4.7, deviceVersion: "11.0.0").storeObject(name: "test")
        //Use name to get object
        let a:JzOsSerializationTests.Device? = "test".getObject()
        //Will reback iPhone 6s / 4.7 / 11.0.0
        print( a!.deviceType)
        print( a!.deviceSize)
        print( a!.deviceVersion)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
