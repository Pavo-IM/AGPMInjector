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
        self.preferredContentSize = NSMakeSize(self.view.frame.size.width, self.view.frame.size.height); 
        super.viewDidLoad()
        
        let getAGPMFilePath = "/System/Library/Extensions/AppleGraphicsPowerManagement.kext/Contents/Info.plist"
        let getAGPMFilePathURL = URL.init(fileURLWithPath: getAGPMFilePath)
        
        // Create Decoder and Encoder objects
        let plistDecoder = PropertyListDecoder()
        
        // Decoder the AppleGraphicsPowerManagement.kext Info.plist and get some information to save as variable
        let data = try! Data(contentsOf: getAGPMFilePathURL)
        let plistData = try! plistDecoder.decode(PlistGet.self, from: data)
        var comboboxArray = [String](plistData.IOKitPersonalities.AGPM.Machines.keys)
        
        func removeItemsFromArray(item: String) {
            if let item = comboboxArray.index(of: "\(item)") {
                comboboxArray.remove(at: item)
            }
        }
        
        func renameItemInArray(olditem: String, newitem: String) {
            if let olditem = comboboxArray.index(of: "\(olditem)") {
                comboboxArray.remove(at: olditem)
                comboboxArray.insert("\(newitem)", at: olditem)
            }
        }
        
        
        // Remove MacbookAir and Unknown machines and rename board-id types to model types
        removeItemsFromArray(item: "MacBookAir2,1")
        removeItemsFromArray(item: "MacBookAir4,1")
        removeItemsFromArray(item: "MacBookAir4,2")
        removeItemsFromArray(item: "Mac-2E6FAB96566FE58C")
        removeItemsFromArray(item: "Mac-35C1E88140C3E6CF")
        removeItemsFromArray(item: "Mac-50619A408DB004DA")
        removeItemsFromArray(item: "Mac-65CE76090165799A")
        removeItemsFromArray(item: "Mac-66F35F19FE2A0D05")
        removeItemsFromArray(item: "Mac-6F01109E16C71B86")
        removeItemsFromArray(item: "Mac-7DF21CB3ED6977E5")
        removeItemsFromArray(item: "Mac-827FAC58A8FDFA22")
        removeItemsFromArray(item: "Mac-937CB26E2E02BB01")
        removeItemsFromArray(item: "Mac-942452F5819B1C1B")
        removeItemsFromArray(item: "Mac-942C5DF58193131B")
        removeItemsFromArray(item: "Mac-9F18E312C5C2BF0B")
        removeItemsFromArray(item: "Mac-ACE8A17C0DE83137")
        removeItemsFromArray(item: "Mac-DB15BD556843C820")
        removeItemsFromArray(item: "Mac-FFE5EF92E7BD251A")
        renameItemInArray(olditem: "Mac-27ADBB7B4CEE8E61", newitem: "iMac14,2")
        renameItemInArray(olditem: "Mac-00BE6ED71E35EB86", newitem: "iMac13,1")
        renameItemInArray(olditem: "Mac-031AEE4D24BFF0B1", newitem: "Macmini6,1")
        renameItemInArray(olditem: "Mac-031B6874CF7F642A", newitem: "iMac14,1")
        renameItemInArray(olditem: "Mac-06F11F11946D27C5", newitem: "MacBookPro11,5")
        renameItemInArray(olditem: "Mac-06F11FD93F0323C5", newitem: "MacBookPro11,4")
        renameItemInArray(olditem: "Mac-189A3D4F975D5FFC", newitem: "MacBookPro11,1")
        renameItemInArray(olditem: "Mac-2BD1B31983FE1663", newitem: "MacBookPro11,3")
        renameItemInArray(olditem: "Mac-35C5E08120C7EEAF", newitem: "Macmini7,1")
        renameItemInArray(olditem: "Mac-3CBD00234E554E41", newitem: "MacBookPro11,2")
        renameItemInArray(olditem: "Mac-42FD25EABCABB274", newitem: "iMac15,1")
        renameItemInArray(olditem: "Mac-473D31EABEB93F9B", newitem: "MacBookPro13,1")
        renameItemInArray(olditem: "Mac-4B682C642B45593E", newitem: "iMac18,1")
        renameItemInArray(olditem: "Mac-4B7AC7E43945597E", newitem: "MacBookPro9,1")
        renameItemInArray(olditem: "Mac-4BC72D62AD45599E", newitem: "Macmini5,2")
        renameItemInArray(olditem: "Mac-1E7E29AD0135F9BC", newitem: "MacBookPro15,3")
        renameItemInArray(olditem: "Mac-551B86E5744E2388", newitem: "MacBookPro14,3")
        renameItemInArray(olditem: "Mac-66E35819EE2D0D05", newitem: "MacBookPro13,2")
        renameItemInArray(olditem: "Mac-6F01561E16C75D06", newitem: "MacBookPro9,2")
        renameItemInArray(olditem: "Mac-77EB7D7DAF985301", newitem: "iMac14,3")
        renameItemInArray(olditem: "Mac-77F17D7DA9285301", newitem: "iMac18,2")
        renameItemInArray(olditem: "Mac-7BA5B2794B2CDB12", newitem: "Macmini5,3")
        renameItemInArray(olditem: "Mac-7BA5B2D9E42DDD94", newitem: "iMacPro1,1")
        renameItemInArray(olditem: "Mac-7BA5B2DFE22DDD8C", newitem: "Macmini8,1")
        renameItemInArray(olditem: "Mac-7DF2A3B5E5D671ED", newitem: "iMac13,3")
        renameItemInArray(olditem: "Mac-81E3E92DD6088272", newitem: "iMac14,4")
        renameItemInArray(olditem: "Mac-827FB448E656EC26", newitem: "MacBookPro15,2")
        renameItemInArray(olditem: "Mac-8ED6AF5B48C039E1", newitem: "Macmini5,1")
        renameItemInArray(olditem: "Mac-937A206F2EE63C01", newitem: "MacBookPro15,1")
        renameItemInArray(olditem: "Mac-9AE82516C7C6B903", newitem: "MacBook9,1")
        renameItemInArray(olditem: "Mac-A369DDC4E67F1C45", newitem: "iMac16,1")
        renameItemInArray(olditem: "Mac-A5C67F76ED83108C", newitem: "MacBookPro13,3")
        renameItemInArray(olditem: "Mac-AFD8A9D944EA4843", newitem: "MacBookPro10,2")
        renameItemInArray(olditem: "Mac-B4831CEBD52A0C4C", newitem: "MacBookPro14,1")
        renameItemInArray(olditem: "Mac-B809C3757DA9BB8D", newitem: "iMac17,1")
        renameItemInArray(olditem: "Mac-BE088AF8C5EB4FA2", newitem: "iMac18,3")
        renameItemInArray(olditem: "Mac-BE0E8AC46FE800CC", newitem: "MacBook8,1")
        renameItemInArray(olditem: "Mac-C3EC7CD22292981F", newitem: "MacBookPro10,1")
        renameItemInArray(olditem: "Mac-CAD6701F7CEA0921", newitem: "MacBookPro14,2")
        renameItemInArray(olditem: "Mac-E43C1C25D4880AD6", newitem: "MacBookPro12,1")
        renameItemInArray(olditem: "Mac-EE2EBD4B90B839A8", newitem: "MacBook10,1")
        renameItemInArray(olditem: "Mac-F305150B0C7DEEEF", newitem: "MacBook8,2")
        renameItemInArray(olditem: "Mac-F60DEB81FF30ACF6", newitem: "MacPro6,1")
        renameItemInArray(olditem: "Mac-F65AE981FFA204ED", newitem: "Macmini6,2")
        renameItemInArray(olditem: "Mac-FA842E06C61E91C5", newitem: "iMac15,2")
        renameItemInArray(olditem: "Mac-FC02E91DDD3FA6A4", newitem: "iMac13,2")
        renameItemInArray(olditem: "Mac-FFE5EF870D7BA81A", newitem: "iMac16,2")
        
        let sortedArray = comboboxArray.sorted()

        myComboBox.removeAllItems()
        myComboBox.addItems(withObjectValues: sortedArray)
        myComboBox.selectItem(at: sortedArray.count-1)
        
    }
    override var representedObject: Any? {
        didSet {

        }
    }
    @IBAction func generateButton(_ sender: Any) {
        let getAGPMFilePath = "/System/Library/Extensions/AppleGraphicsPowerManagement.kext/Contents/Info.plist"
        let getAGPMFilePathURL = URL.init(fileURLWithPath: getAGPMFilePath)
        
        // Create Decoder and Encoder objects
        let plistDecoder = PropertyListDecoder()
        
        // Decoder the AppleGraphicsPowerManagement.kext Info.plist and get some information to save as variable
        let data = try! Data(contentsOf: getAGPMFilePathURL)
        let plistData = try! plistDecoder.decode(PlistGet.self, from: data)
        // Write the AGPMInjector.kext/Contents directory to the users Desktop and copying AGPMInjector.plist into that directory as Info.plist
        let setAGPMInjectorDirectory = "AGPMInjector.kext/Contents"
        let setInfoPlistName = "Info.plist"
        let fileManager = FileManager.default
        let tDocumentDirectory = fileManager.urls(for: .desktopDirectory, in: .userDomainMask).first!
        let filePath =  tDocumentDirectory.appendingPathComponent("\(setAGPMInjectorDirectory)")
        let plistEncoder = PropertyListEncoder()
        plistEncoder.outputFormat = .xml
        
        
        // Set the default properties of the root section of the plist
        let bundleID = "com.apple.driver.AGPMInjector"
        let bundleName = "AGPMInjector"
        let bundleShortVersionName = "1.0-AGPMInjector"
        let bundleSig = "????"
        
        // Create a object to represent the plist data to get encoded
        if myComboBox.stringValue == "iMacPro1,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "iMacPro1,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacPro5,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacPro5,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacPro4,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacPro4,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacPro6,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacPro6,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "iMac14,2" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "iMac14,2"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "iMac13,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "iMac13,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "Macmini6,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "Macmini6,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "iMac14,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "iMac14,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBookPro11,5" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBookPro11,5"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBookPro11,4" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBookPro11,4"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBookPro11,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBookPro11,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBookPro11,3" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBookPro11,3"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "Macmini7,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "Macmini7,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBookPro11,2" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBookPro11,2"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "iMac15,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "iMac15,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBookPro13,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBookPro13,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "iMac18,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "iMac18,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBookPro9,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBookPro9,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "Macmini5,2" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "Macmini5,2"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBookPro8,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBookPro8,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBookPro15,3" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBookPro15,3"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBookPro14,3" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBookPro14,3"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "iMac17,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "iMac17,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBookPro13,2" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBookPro13,2"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBookPro9,2" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBookPro9,2"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "iMac14,3" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "iMac14,3"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "iMac18,2" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "iMac18,2"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "Macmini5,3" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "Macmini5,3"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "Macmini8,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "Macmini8,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "iMac13,3" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "iMac13,3"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "iMac14,4" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "iMac14,4"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBookPro15,2" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBookPro15,2"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "Macmini5,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "Macmini5,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBookPro15,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBookPro15,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBook9,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBook9,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "iMac16,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "iMac16,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBookPro13,3" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBookPro13,3"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBookPro10,2" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBookPro10,2"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBookPro14,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBookPro14,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "iMac18,3" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "iMac18,3"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBook8,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBook8,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBookPro10,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBookPro10,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBookPro14,2" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBookPro14,2"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBookPro12,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBookPro12,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBook10,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBook10,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBook8,2" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBook8,2"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "Macmini6,2" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "Macmini6,2"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "iMac15,2" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "iMac15,2"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "iMac13,2" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "iMac13,2"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "iMac16,2" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "iMac16,2"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "iMac9,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "iMac9,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "iMac12,2" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "iMac12,2"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "iMac12,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "iMac12,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "iMac11,3" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "iMac11,3"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "iMac11,2" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "iMac11,2"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "iMac11,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "iMac11,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "iMac10,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "iMac10,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "Macmini4,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "Macmini4,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "Macmini3,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "Macmini3,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBookPro8,3" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBookPro8,3"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBookPro8,2" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBookPro8,2"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBookPro7,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBookPro7,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBookPro6,2" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBookPro6,2"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBookPro6,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBookPro6,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBookPro5,5" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBookPro5,5"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBookPro5,4" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBookPro5,4"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBookPro5,3" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBookPro5,3"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBookPro5,2" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBookPro5,2"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBookPro5,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBookPro5,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBook7,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBook7,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBook5,2" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBook5,2"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
        if myComboBox.stringValue == "MacBook5,1" {
            struct PlistSet: Codable {
                let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
                let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
                let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
                let IOKitPersonalities: IOKitPersonalities
                let osBundleRequired: String
                enum CodingKeys: String, CodingKey {
                    case buildMachineOSBuild = "BuildMachineOSBuild"
                    case cfBundleDevelopmentRegion = "CFBundleDevelopmentRegion"
                    case cfBundleGetInfoString = "CFBundleGetInfoString"
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case cfBundleInfoDictionaryVersion = "CFBundleInfoDictionaryVersion"
                    case cfBundleName = "CFBundleName"
                    case cfBundlePackageType = "CFBundlePackageType"
                    case cfBundleShortVersionString = "CFBundleShortVersionString"
                    case cfBundleSignature = "CFBundleSignature"
                    case cfBundleVersion = "CFBundleVersion"
                    case nsHumanReadableCopyright = "NSHumanReadableCopyright"
                    case IOKitPersonalities
                    case osBundleRequired = "OSBundleRequired"
                }
            }
            struct IOKitPersonalities: Codable {
                let AGPM: AGPM
            }
            struct AGPM: Codable {
                let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
                let Machines: Machines
                enum CodingKeys: String, CodingKey {
                    case cfBundleIdentifier = "CFBundleIdentifier"
                    case ioClass = "IOClass"
                    case ioNameMatch = "IONameMatch"
                    case ioProviderClass = "IOProviderClass"
                    case Machines
                }
            }
            struct Machines: Codable {
                var macPro51: MacPro
                enum CodingKeys: String, CodingKey {
                    case macPro51 = "MacBook5,1"
                }
            }
            struct MacPro: Codable {
                let GFX0: GFX0
            }
            struct GFX0: Codable {
                let agdcEnabled: Int
                let Heuristic: Heuristic
                let maxPowerState, minPowerState, controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case maxPowerState = "max-power-state"
                    case minPowerState = "min-power-state"
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: -1), maxPowerState: 15, minPowerState: 0, controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            do {
                try fileManager.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(plistToEncode)
                try data.write(to: InfoPlistfilePath)
            }
            catch {
                print(error.localizedDescription)
            }
        }
     
    }
    
}

