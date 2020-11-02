[![Platform](https://img.shields.io/badge/Platform-%20IOS%20-brightgreen.svg)](https://github.com/sam38124)
[![characteristic](https://img.shields.io/badge/特點-%20輕量級%20%7C%20簡單易用%20%20%7C%20穩定%20-brightgreen.svg)](https://github.com/sam38124)
# JzOsSerialization
This is a serialization framework for ios can very easily to store and get object by a simple class
## List
* [Import to project](#Import)
* [Quick Start](#start)
* [About me](#About)


<a name="Import"></a>
## Import to project
> Support Swift Package。 <br/>

#### 1.Open xcode and paste link for Swift Package
+ > ##### https://github.com/sam38124/TestLibrary/JzOsSerialization
<a name="start"></a>
## Quick Start
```swift
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
```



<a name="About"></a>
# About me
#### <font color="#0000dd"> Work for: </font><br /> 
+ ##### <font color="#660000">【Orange Electronic】橙的電子-Deputy Head of R&D </font><br /> 
+ ##### <font color="#660000">【Square Studio】四方工作室-CEO </font><br />
#### <font color="#0000dd"> Main skill: </font><br /> 
+ ##### Android and IOS(4 years)<br/>  
+ ##### Jsp(2 years)<br/> 
+ ##### Javascript and Jquery and Ktor(1 years)<br /> 
#### <font color="#0000dd"> Contact information: </font><br /> 
+  ##### line:sam38124<br /> 

+  ##### gmail:sam38124@gmail.com

