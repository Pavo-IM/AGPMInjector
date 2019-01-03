//
//  ViewController.swift
//  AGPMInjector
//
//  Created by Pavo on 12/28/18.
//  Copyright © 2018 Pavo. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {


    @IBOutlet weak var myComboBox: NSComboBox!
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
        var comboboxArray = [String](plistData.IOKitPersonalities.AGPM.Machines.keys)
        if let Mac27ADBB7B4CEE8E61 = comboboxArray.index(of: "Mac-27ADBB7B4CEE8E61") {
            comboboxArray.remove(at: Mac27ADBB7B4CEE8E61)
            comboboxArray.insert("iMac14,2", at: Mac27ADBB7B4CEE8E61)
        }
        if let Mac00BE6ED71E35EB86 = comboboxArray.index(of: "Mac-00BE6ED71E35EB86") {
            comboboxArray.remove(at: Mac00BE6ED71E35EB86)
            comboboxArray.insert("iMac13,1", at: Mac00BE6ED71E35EB86)
        }
        
        if let Mac031AEE4D24BFF0B1 = comboboxArray.index(of: "Mac-031AEE4D24BFF0B1") {
            comboboxArray.remove(at: Mac031AEE4D24BFF0B1)
            comboboxArray.insert("Macmini6,1", at: Mac031AEE4D24BFF0B1)
        }
        
        if let Mac031B6874CF7F642A = comboboxArray.index(of: "Mac-031B6874CF7F642A") {
            comboboxArray.remove(at: Mac031B6874CF7F642A)
            comboboxArray.insert("iMac14,1", at: Mac031B6874CF7F642A)
        }
        
        if let Mac06F11F11946D27C5 = comboboxArray.index(of: "Mac-06F11F11946D27C5") {
            comboboxArray.remove(at: Mac06F11F11946D27C5)
            comboboxArray.insert("MacBookPro11,5", at: Mac06F11F11946D27C5)
        }
        
        if let Mac06F11FD93F0323C5 = comboboxArray.index(of: "Mac-06F11FD93F0323C5") {
            comboboxArray.remove(at: Mac06F11FD93F0323C5)
            comboboxArray.insert("MacBookPro11,4", at: Mac06F11FD93F0323C5)
        }
        
        if let Mac189A3D4F975D5FFC = comboboxArray.index(of: "Mac-189A3D4F975D5FFC") {
            comboboxArray.remove(at: Mac189A3D4F975D5FFC)
            comboboxArray.insert("MacBookPro11,1", at: Mac189A3D4F975D5FFC)
        }
        
        if let Mac2BD1B31983FE1663 = comboboxArray.index(of: "Mac-2BD1B31983FE1663") {
            comboboxArray.remove(at: Mac2BD1B31983FE1663)
            comboboxArray.insert("MacBookPro11,3", at: Mac2BD1B31983FE1663)
        }
        
        if let Mac2E6FAB96566FE58C = comboboxArray.index(of: "Mac-2E6FAB96566FE58C") {
            comboboxArray.remove(at: Mac2E6FAB96566FE58C)
            comboboxArray.insert("MacBookAir5,2", at: Mac2E6FAB96566FE58C)
        }
        
        if let Mac35C1E88140C3E6CF = comboboxArray.index(of: "Mac-35C1E88140C3E6CF") {
            comboboxArray.remove(at: Mac35C1E88140C3E6CF)
            comboboxArray.insert("MacBookAir6,1", at: Mac35C1E88140C3E6CF)
        }
        
        if let Mac35C5E08120C7EEAF = comboboxArray.index(of: "Mac-35C5E08120C7EEAF") {
            comboboxArray.remove(at: Mac35C5E08120C7EEAF)
            comboboxArray.insert("Macmini7,1", at: Mac35C5E08120C7EEAF)
        }
        
        if let Mac3CBD00234E554E41 = comboboxArray.index(of: "Mac-3CBD00234E554E41") {
            comboboxArray.remove(at: Mac3CBD00234E554E41)
            comboboxArray.insert("MacBookPro11,2", at: Mac3CBD00234E554E41)
        }
        
        if let Mac42FD25EABCABB274 = comboboxArray.index(of: "Mac-42FD25EABCABB274") {
            comboboxArray.remove(at: Mac42FD25EABCABB274)
            comboboxArray.insert("iMac15,1", at: Mac42FD25EABCABB274)
        }
        
        if let Mac473D31EABEB93F9B = comboboxArray.index(of: "Mac-473D31EABEB93F9B") {
            comboboxArray.remove(at: Mac473D31EABEB93F9B)
            comboboxArray.insert("MacBookPro13,1", at: Mac473D31EABEB93F9B)
        }
        
        if let Mac4B682C642B45593E = comboboxArray.index(of: "Mac-4B682C642B45593E") {
            comboboxArray.remove(at: Mac4B682C642B45593E)
            comboboxArray.insert("iMac18,1", at: Mac4B682C642B45593E)
        }
        
        if let Mac4B7AC7E43945597E = comboboxArray.index(of: "Mac-4B7AC7E43945597E") {
            comboboxArray.remove(at: Mac4B7AC7E43945597E)
            comboboxArray.insert("MacBookPro9,1", at: Mac4B7AC7E43945597E)
        }
        
        if let Mac4BC72D62AD45599E = comboboxArray.index(of: "Mac-4BC72D62AD45599E") {
            comboboxArray.remove(at: Mac4BC72D62AD45599E)
            comboboxArray.insert("Macmini5,2", at: Mac4BC72D62AD45599E)
        }
        
        if let Mac50619A408DB004DA = comboboxArray.index(of: "Mac-50619A408DB004DA") {
            comboboxArray.remove(at: Mac50619A408DB004DA)
            comboboxArray.insert("MacBookPro8,1", at: Mac50619A408DB004DA)
        }
        
        if let Mac1E7E29AD0135F9BC = comboboxArray.index(of: "Mac-1E7E29AD0135F9BC") {
            comboboxArray.remove(at: Mac1E7E29AD0135F9BC)
            comboboxArray.insert("MacBookPro15,3", at: Mac1E7E29AD0135F9BC)
        }
        
        if let Mac551B86E5744E2388 = comboboxArray.index(of: "Mac-551B86E5744E2388") {
            comboboxArray.remove(at: Mac551B86E5744E2388)
            comboboxArray.insert("MacBookPro14,3", at: Mac551B86E5744E2388)
        }
        
        if let Mac65CE76090165799A = comboboxArray.index(of: "Mac-65CE76090165799A") {
            comboboxArray.remove(at: Mac65CE76090165799A)
            comboboxArray.insert("iMac17,1", at: Mac65CE76090165799A)
        }
        
        if let Mac66E35819EE2D0D05 = comboboxArray.index(of: "Mac-66E35819EE2D0D05") {
            comboboxArray.remove(at: Mac66E35819EE2D0D05)
            comboboxArray.insert("MacBookPro13,2", at: Mac66E35819EE2D0D05)
        }
        
        if let Mac66F35F19FE2A0D05 = comboboxArray.index(of: "Mac-66F35F19FE2A0D05") {
            comboboxArray.remove(at: Mac66F35F19FE2A0D05)
            comboboxArray.insert("MacBookAir5,1", at: Mac66F35F19FE2A0D05)
        }
        
        if let Mac6F01109E16C71B86 = comboboxArray.index(of: "Mac-6F01109E16C71B86") {
            comboboxArray.remove(at: Mac6F01109E16C71B86)
            comboboxArray.insert("MacBookAir6,2", at: Mac6F01109E16C71B86)
        }
        
        if let Mac6F01561E16C75D06 = comboboxArray.index(of: "Mac-6F01561E16C75D06") {
            comboboxArray.remove(at: Mac6F01561E16C75D06)
            comboboxArray.insert("MacBookPro9,2", at: Mac6F01561E16C75D06)
        }
        
        if let Mac77EB7D7DAF985301 = comboboxArray.index(of: "Mac-77EB7D7DAF985301") {
            comboboxArray.remove(at: Mac77EB7D7DAF985301)
            comboboxArray.insert("iMac14,3", at: Mac77EB7D7DAF985301)
        }
        
        if let Mac77F17D7DA9285301 = comboboxArray.index(of: "Mac-77F17D7DA9285301") {
            comboboxArray.remove(at: Mac77F17D7DA9285301)
            comboboxArray.insert("iMac18,2", at: Mac77F17D7DA9285301)
        }
        
        if let Mac7BA5B2794B2CDB12 = comboboxArray.index(of: "Mac-7BA5B2794B2CDB12") {
            comboboxArray.remove(at: Mac7BA5B2794B2CDB12)
            comboboxArray.insert("Macmini5,3", at: Mac7BA5B2794B2CDB12)
        }
        
        if let Mac7BA5B2D9E42DDD94 = comboboxArray.index(of: "Mac-7BA5B2D9E42DDD94") {
            comboboxArray.remove(at: Mac7BA5B2D9E42DDD94)
            comboboxArray.insert("iMacPro1,1", at: Mac7BA5B2D9E42DDD94)
        }
        
        if let Mac7BA5B2DFE22DDD8C = comboboxArray.index(of: "Mac-7BA5B2DFE22DDD8C") {
            comboboxArray.remove(at: Mac7BA5B2DFE22DDD8C)
            comboboxArray.insert("Macmini8,1", at: Mac7BA5B2DFE22DDD8C)
        }
        
        if let Mac7DF21CB3ED6977E5 = comboboxArray.index(of: "Mac-7DF21CB3ED6977E5") {
            comboboxArray.remove(at: Mac7DF21CB3ED6977E5)
            comboboxArray.insert("MacBookAir6,2", at: Mac7DF21CB3ED6977E5)
        }
        
        if let Mac7DF2A3B5E5D671ED = comboboxArray.index(of: "Mac-7DF2A3B5E5D671ED") {
            comboboxArray.remove(at: Mac7DF2A3B5E5D671ED)
            comboboxArray.insert("iMac13,3", at: Mac7DF2A3B5E5D671ED)
        }
        
        if let Mac81E3E92DD6088272 = comboboxArray.index(of: "Mac-81E3E92DD6088272") {
            comboboxArray.remove(at: Mac81E3E92DD6088272)
            comboboxArray.insert("iMac14,4", at: Mac81E3E92DD6088272)
        }
        
        if let Mac827FAC58A8FDFA22 = comboboxArray.index(of: "Mac-827FAC58A8FDFA22") {
            comboboxArray.remove(at: Mac827FAC58A8FDFA22)
            comboboxArray.insert("MacBookAir8,1", at: Mac827FAC58A8FDFA22)
        }
        
        if let Mac827FB448E656EC26 = comboboxArray.index(of: "Mac-827FB448E656EC26") {
            comboboxArray.remove(at: Mac827FB448E656EC26)
            comboboxArray.insert("MacBookPro15,2", at: Mac827FB448E656EC26)
        }
        
        if let Mac8ED6AF5B48C039E1 = comboboxArray.index(of: "Mac-8ED6AF5B48C039E1") {
            comboboxArray.remove(at: Mac8ED6AF5B48C039E1)
            comboboxArray.insert("Macmini5,1", at: Mac8ED6AF5B48C039E1)
        }
        
        if let Mac937A206F2EE63C01 = comboboxArray.index(of: "Mac-937A206F2EE63C01") {
            comboboxArray.remove(at: Mac937A206F2EE63C01)
            comboboxArray.insert("MacBookPro15,1", at: Mac937A206F2EE63C01)
        }
        
        if let Mac937CB26E2E02BB01 = comboboxArray.index(of: "Mac-937CB26E2E02BB01") {
            comboboxArray.remove(at: Mac937CB26E2E02BB01)
            comboboxArray.insert("MacBookAir7,2", at: Mac937CB26E2E02BB01)
        }
        
        if let Mac942452F5819B1C1B = comboboxArray.index(of: "Mac-942452F5819B1C1B") {
            comboboxArray.remove(at: Mac942452F5819B1C1B)
            comboboxArray.insert("MacBookAir3,1", at: Mac942452F5819B1C1B)
        }
        
        if let Mac942C5DF58193131B = comboboxArray.index(of: "Mac-942C5DF58193131B") {
            comboboxArray.remove(at: Mac942C5DF58193131B)
            comboboxArray.insert("MacBookAir3,2", at: Mac942C5DF58193131B)
        }
        
        if let Mac9AE82516C7C6B903 = comboboxArray.index(of: "Mac-9AE82516C7C6B903") {
            comboboxArray.remove(at: Mac9AE82516C7C6B903)
            comboboxArray.insert("MacBook9,1", at: Mac9AE82516C7C6B903)
        }
        
        if let Mac9F18E312C5C2BF0B = comboboxArray.index(of: "Mac-9F18E312C5C2BF0B") {
            comboboxArray.remove(at: Mac9F18E312C5C2BF0B)
            comboboxArray.insert("MacBookAir7,1", at: Mac9F18E312C5C2BF0B)
        }
        
        if let MacA369DDC4E67F1C45 = comboboxArray.index(of: "Mac-A369DDC4E67F1C45") {
            comboboxArray.remove(at: MacA369DDC4E67F1C45)
            comboboxArray.insert("iMac16,1", at: MacA369DDC4E67F1C45)
        }
        
        if let MacA5C67F76ED83108C = comboboxArray.index(of: "Mac-A5C67F76ED83108C") {
            comboboxArray.remove(at: MacA5C67F76ED83108C)
            comboboxArray.insert("MacBookPro13,3", at: MacA5C67F76ED83108C)
        }
        
        if let MacACE8A17C0DE83137 = comboboxArray.index(of: "Mac-ACE8A17C0DE83137") {
            comboboxArray.remove(at: MacACE8A17C0DE83137)
        }
        
        if let MacAFD8A9D944EA4843 = comboboxArray.index(of: "Mac-AFD8A9D944EA4843") {
            comboboxArray.remove(at: MacAFD8A9D944EA4843)
            comboboxArray.insert("MacBookPro10,2", at: MacAFD8A9D944EA4843)
        }
        
        if let MacB4831CEBD52A0C4C = comboboxArray.index(of: "Mac-B4831CEBD52A0C4C") {
            comboboxArray.remove(at: MacB4831CEBD52A0C4C)
            comboboxArray.insert("MacBookPro14,1", at: MacB4831CEBD52A0C4C)
        }
        
        if let MacB809C3757DA9BB8D = comboboxArray.index(of: "Mac-B809C3757DA9BB8D") {
            comboboxArray.remove(at: MacB809C3757DA9BB8D)
            comboboxArray.insert("iMac17,1", at: MacB809C3757DA9BB8D)
        }
        
        if let MacBE088AF8C5EB4FA2 = comboboxArray.index(of: "Mac-BE088AF8C5EB4FA2") {
            comboboxArray.remove(at: MacBE088AF8C5EB4FA2)
            comboboxArray.insert("iMac18,3", at: MacBE088AF8C5EB4FA2)
        }
        
        if let MacBE0E8AC46FE800CC = comboboxArray.index(of: "Mac-BE0E8AC46FE800CC") {
            comboboxArray.remove(at: MacBE0E8AC46FE800CC)
            comboboxArray.insert("MacBook8,1", at: MacBE0E8AC46FE800CC)
        }
        
        if let MacC3EC7CD22292981F = comboboxArray.index(of: "Mac-C3EC7CD22292981F") {
            comboboxArray.remove(at: MacC3EC7CD22292981F)
            comboboxArray.insert("MacBookPro10,1", at: MacC3EC7CD22292981F)
        }
        
        if let MacCAD6701F7CEA0921 = comboboxArray.index(of: "Mac-CAD6701F7CEA0921") {
            comboboxArray.remove(at: MacCAD6701F7CEA0921)
            comboboxArray.insert("MacBookPro14,2", at: MacCAD6701F7CEA0921)
        }
        
        if let MacDB15BD556843C820 = comboboxArray.index(of: "Mac-DB15BD556843C820") {
            comboboxArray.remove(at: MacDB15BD556843C820)
            comboboxArray.insert("iMac17,1", at: MacDB15BD556843C820)
        }
        
        if let MacE43C1C25D4880AD6 = comboboxArray.index(of: "Mac-E43C1C25D4880AD6") {
            comboboxArray.remove(at: MacE43C1C25D4880AD6)
            comboboxArray.insert("MacBookPro12,1", at: MacE43C1C25D4880AD6)
        }
        
        if let MacEE2EBD4B90B839A8 = comboboxArray.index(of: "Mac-EE2EBD4B90B839A8") {
            comboboxArray.remove(at: MacEE2EBD4B90B839A8)
            comboboxArray.insert("MacBook10,1", at: MacEE2EBD4B90B839A8)
        }
        
        if let MacF305150B0C7DEEEF = comboboxArray.index(of: "Mac-F305150B0C7DEEEF") {
            comboboxArray.remove(at: MacF305150B0C7DEEEF)
            comboboxArray.insert("MacBook8,2", at: MacF305150B0C7DEEEF)
        }
        
        if let MacF60DEB81FF30ACF6 = comboboxArray.index(of: "Mac-F60DEB81FF30ACF6") {
            comboboxArray.remove(at: MacF60DEB81FF30ACF6)
            comboboxArray.insert("MacPro6,1", at: MacF60DEB81FF30ACF6)
        }
        
        if let MacF65AE981FFA204ED = comboboxArray.index(of: "Mac-F65AE981FFA204ED") {
            comboboxArray.remove(at: MacF65AE981FFA204ED)
            comboboxArray.insert("Macmini6,2", at: MacF65AE981FFA204ED)
        }
        
        if let MacFA842E06C61E91C5 = comboboxArray.index(of: "Mac-FA842E06C61E91C5") {
            comboboxArray.remove(at: MacFA842E06C61E91C5)
            comboboxArray.insert("iMac15,2", at: MacFA842E06C61E91C5)
        }
        
        if let MacFC02E91DDD3FA6A4 = comboboxArray.index(of: "Mac-FC02E91DDD3FA6A4") {
            comboboxArray.remove(at: MacFC02E91DDD3FA6A4)
            comboboxArray.insert("iMac13,2", at: MacFC02E91DDD3FA6A4)
        }
        
        if let MacFFE5EF870D7BA81A = comboboxArray.index(of: "Mac-FFE5EF870D7BA81A") {
            comboboxArray.remove(at: MacFFE5EF870D7BA81A)
            comboboxArray.insert("iMac16,2", at: MacFFE5EF870D7BA81A)
        }
        
        if let MacFFE5EF92E7BD251A = comboboxArray.index(of: "Mac-FFE5EF92E7BD251A") {
            comboboxArray.remove(at: MacFFE5EF92E7BD251A)
        }
        
        let sortedArray = comboboxArray.sorted()
//        for i in sortedArray {
//            print(i)
//        }
        
        myComboBox.removeAllItems()
        myComboBox.addItems(withObjectValues: sortedArray)
        myComboBox.selectItem(at: sortedArray.count-1)
        
        
        
        // Write the AGPMInjector.kext/Contents directory to the users Desktop and copying AGPMInjector.plist into that directory as Info.plist
//        let setAGPMInjectorDirectory = "AGPMInjector.kext/Contents"
//        let setInforPlistLocation = "Info.plist"
//        let fileManager = FileManager.default
//        let tDocumentDirectory = fileManager.urls(for: .desktopDirectory, in: .userDomainMask).first!
//        let filePath =  tDocumentDirectory.appendingPathComponent("\(setAGPMInjectorDirectory)")
//
//        // Set the default properties of the root section of the plist
//        let bundleID = "com.apple.driver.AGPMInjector"
//        let bundleName = "AGPMInjector"
//        let bundleShortVersionName = "1.0-AGPMInjector"
//        let bundleSig = "????"
//
//        // Create a object to represent the plist data to get encoded
//        let testEncoding = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, ioKitPersonalities: PlistSet.IOKitPersonalities(AGPM: PlistSet.IOKitPersonalities.AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: PlistSet.IOKitPersonalities.AGPM.Machines(macPro61: PlistSet.IOKitPersonalities.AGPM.Machines.macPro61(Gfx0: PlistSet.IOKitPersonalities.AGPM.Machines.macPro61.Gfx0(agdcEnabled: 1, heuristic: PlistSet.IOKitPersonalities.AGPM.Machines.macPro61.Gfx0.Heuristic(id: -1), maxPowerState: 15, minPowerState: 0, controlID: 1))))), osBundleRequired: plistData.osBundleRequired)
//
//        do {
//            // Encode the Plist properties and write it to the Info.plist file being saved to the current logged in user's desktop
//            try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
//            let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInforPlistLocation)")
//            let dataSet = try plistEncoder.encode(testEncoding)
//            try dataSet.write(to: InfoPlistfilePath)
//        } catch {
//            print(error)
//        }
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

}

