//
//  ViewController.swift
//  AGPMInjector
//
//  Created by Henry Brock on 12/28/18.
//  Copyright © 2018 Pavo. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Get the URL of the Info.plist from AppleGraphicsPowerManagement.kext.
        let getAGPMFilePath = "/System/Library/Extensions/AppleGraphicsPowerManagement.kext/Contents/Info.plist"
        let getAGPMFilePathURL = URL.init(fileURLWithPath: getAGPMFilePath)

        
        // This is for writing the AGPMInjector.kext/Contents directory to the users Desktop and copying AGPMInjector.plist into that directory as Info.plist
                let setAGPMInjectorDirectory = "AGPMInjector.kext/Contents"
                let setInforPlistLocation = "Info.plist"
                let fileManager = FileManager.default
                let setAGPMInjectorPath = Bundle.main.url(forResource: "AGPMInjector", withExtension: "plist")!
                let tDocumentDirectory = fileManager.urls(for: .desktopDirectory, in: .userDomainMask).first!
                let filePath =  tDocumentDirectory.appendingPathComponent("\(setAGPMInjectorDirectory)")
                do {
                    try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                    let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInforPlistLocation)")
                    try fileManager.copyItem(at: setAGPMInjectorPath, to: InfoPlistfilePath)
        //        } catch {
        //            print(error)
        //        }
        
        // Trying to set the RawValue of VendorIDDeviceID in the GetAGPMInfo struct
        //        let vendorID = "1002"
        //        let deviceID = "2001"
        //        let bringTogether = "Vendor\(vendorID)Device\(deviceID)"
        //        let test2: GetAGPMInfo.vendor.CodingKeys.RawValue = bringTogether
        
        
        
        // Decode the Info.plist using the structure of GetAGPMInfo and GetAGDPInfo
//        do {
            let data = try Data(contentsOf: getAGPMFilePathURL)
            let decoder = PropertyListDecoder()
            let AGPMListData = try decoder.decode(GetAGPMInfo.self, from: data)
            let someSettings = AGPMListData
            let encoder = PropertyListEncoder()
            encoder.outputFormat = .xml
            let bundleIdentifer = try decoder.decode(GetAGPMInfo.AGPM.self, from: data)
            print(bundleIdentifer)
            let dataSet = try encoder.encode(someSettings)
            try dataSet.write(to: InfoPlistfilePath)
        } catch {
            print(error)
        }
        
        //
        //        do {
        //            let data = try Data(contentsOf: getAGDPFilePathURL)
        //            let decoder = PropertyListDecoder()
        //            let AGDPListData = try decoder.decode(GetAGDPInfo.self, from: data)
        //            print([AGDPListData])
        //            } catch {
        //                NSLog(error as! String)
        //            }
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

