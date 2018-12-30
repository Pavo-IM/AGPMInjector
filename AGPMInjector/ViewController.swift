//
//  ViewController.swift
//  AGPMInjector
//
//  Created by Pavo on 12/28/18.
//  Copyright © 2018 Pavo. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Get the URL of the Info.plist path from AppleGraphicsPowerManagement.kext.
        let getAGPMFilePath = "/System/Library/Extensions/AppleGraphicsPowerManagement.kext/Contents/Info.plist"
        let getAGPMFilePathURL = URL.init(fileURLWithPath: getAGPMFilePath)

        
        // This is for writing the AGPMInjector.kext/Contents directory to the users Desktop and copying AGPMInjector.plist into that directory as Info.plist
                let setAGPMInjectorDirectory = "AGPMInjector.kext/Contents"
                let setInforPlistLocation = "Info.plist"
                let fileManager = FileManager.default
//                let setAGPMInjectorPath = Bundle.main.url(forResource: "AGPMInjector", withExtension: "plist")!
                let tDocumentDirectory = fileManager.urls(for: .desktopDirectory, in: .userDomainMask).first!
                let filePath =  tDocumentDirectory.appendingPathComponent("\(setAGPMInjectorDirectory)")
                do {
                    let data = try Data(contentsOf: getAGPMFilePathURL)
                    let decoder = PropertyListDecoder()
                    let AGPMListData = try decoder.decode(GetAGPMInfo.self, from: data)
                    print(AGPMListData)
                    try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
//                    let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInforPlistLocation)")
//                    let someSettings = testData
//                    let encoder = PropertyListEncoder()
//                    encoder.outputFormat = .xml
//                    let dataSet = try encoder.encode(someSettings)
//                    try dataSet.write(to: InfoPlistfilePath)
                } catch {
                    print(error)
        }
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

