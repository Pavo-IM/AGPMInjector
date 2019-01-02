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
        
        // Create Decoder and Encoder objects
        let plistDecoder = PropertyListDecoder()
        let plistEncoder = PropertyListEncoder()
        plistEncoder.outputFormat = .xml

        // Decoder the AppleGraphicsPowerManagement.kext Info.plist and get some information to save as variable
        let data = try! Data(contentsOf: getAGPMFilePathURL)
        let plistData = try! plistDecoder.decode(PlistGet.self, from: data)
        
        
        // Write the AGPMInjector.kext/Contents directory to the users Desktop and copying AGPMInjector.plist into that directory as Info.plist
        let setAGPMInjectorDirectory = "AGPMInjector.kext/Contents"
        let setInforPlistLocation = "Info.plist"
        let fileManager = FileManager.default
        let tDocumentDirectory = fileManager.urls(for: .desktopDirectory, in: .userDomainMask).first!
        let filePath =  tDocumentDirectory.appendingPathComponent("\(setAGPMInjectorDirectory)")

        // Set the default properties of the root section of the plist
        let bundleID = "com.apple.driver.AGPMInjector"
        let bundleName = "AGPMInjector"
        let bundleShortVersionName = "1.0-AGPMInjector"
        let bundleSig = "????"
        
        // Create a object to represent the plist data to get encoded
        let testEncoding = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, ioKitPersonalities: PlistSet.IOKitPersonalities(agpm: PlistSet.IOKitPersonalities.Agpm(cfBundleIdentifier: plistData.ioKitPersonalities.agpm.cfBundleIdentifier, ioClass: plistData.ioKitPersonalities.agpm.ioClass, ioNameMatch: plistData.ioKitPersonalities.agpm.ioNameMatch, ioProviderClass: plistData.ioKitPersonalities.agpm.ioProviderClass, machines: PlistSet.IOKitPersonalities.Agpm.Machines(macPro61: PlistSet.IOKitPersonalities.Agpm.Machines.macPro61(Gfx0: PlistSet.IOKitPersonalities.Agpm.Machines.macPro61.Gfx0(agdcEnabled: 1, heuristic: PlistSet.IOKitPersonalities.Agpm.Machines.macPro61.Gfx0.Heuristic(id: -1), maxPowerState: 15, minPowerState: 0, controlID: 1))))), osBundleRequired: plistData.osBundleRequired)

        do {
            // Encode the Plist properties and write it to the Info.plist file being saved to the current logged in user's desktop
            try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
            let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInforPlistLocation)")
            let dataSet = try plistEncoder.encode(testEncoding)
            try dataSet.write(to: InfoPlistfilePath)
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

