//
//  ViewController.swift
//  AGPMInjector
//
//  Created by Pavo on 12/28/18.
//  Copyright © 2018 Pavo. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    let getAGPMFilePath = "/System/Library/Extensions/AppleGraphicsPowerManagement.kext/Contents/Info.plist"
    let bundleID = "com.apple.driver.AGPMInjector"
    let bundleName = "AGPMInjector"
    let bundleShortVersionName = "2.3.3-AGPMInjector"
    let bundleSig = "????"
    let bundleReq = "Local-Root"
    // Create Decoder object
    let plistDecoder = PropertyListDecoder()
    // Create Decoder and Encoder objects
    let plistEncoder = PropertyListEncoder()
    
    // Write the AGPMInjector.kext/Contents directory to the users Desktop and copying AGPMInjector.plist into that directory as Info.plist
    let setAGPMInjectorDirectory = "AGPMInjector.kext/Contents"
    let setInfoPlistName = "Info.plist"
    let tDocumentDirectory = FileManager.default.urls(for: .desktopDirectory, in: .userDomainMask).first!
    
    @IBOutlet weak var popButton: NSPopUpButton!
    @IBOutlet weak var iGPULabel: NSTextField!
    @IBOutlet weak var yesChecked: NSButton!
    override func viewDidLoad() {
        self.preferredContentSize = NSMakeSize(self.view.frame.size.width, self.view.frame.size.height); 
        super.viewDidLoad()
        let getAGPMFilePathURL = URL.init(fileURLWithPath: getAGPMFilePath)
        plistEncoder.outputFormat = .xml
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
        
        // Remove machines that do not make sense to have "desktop" type of GPU and rename board-id types to model types
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
        removeItemsFromArray(item: "Mac-031AEE4D24BFF0B1")
        removeItemsFromArray(item: "Mac-06F11F11946D27C5")
        removeItemsFromArray(item: "Mac-06F11FD93F0323C5")
        removeItemsFromArray(item: "Mac-189A3D4F975D5FFC")
        removeItemsFromArray(item: "Mac-2BD1B31983FE1663")
        removeItemsFromArray(item: "Mac-35C5E08120C7EEAF")
        removeItemsFromArray(item: "Mac-3CBD00234E554E41")
        removeItemsFromArray(item: "Mac-473D31EABEB93F9B")
        removeItemsFromArray(item: "Mac-4B7AC7E43945597E")
        removeItemsFromArray(item: "Mac-4BC72D62AD45599E")
        removeItemsFromArray(item: "Mac-1E7E29AD0135F9BC")
        removeItemsFromArray(item: "Mac-551B86E5744E2388")
        removeItemsFromArray(item: "Mac-66E35819EE2D0D05")
        removeItemsFromArray(item: "Mac-6F01561E16C75D06")
        removeItemsFromArray(item: "Mac-7BA5B2794B2CDB12")
        removeItemsFromArray(item: "Mac-7BA5B2DFE22DDD8C")
        removeItemsFromArray(item: "Mac-827FB448E656EC26")
        removeItemsFromArray(item: "Mac-8ED6AF5B48C039E1")
        removeItemsFromArray(item: "Mac-937A206F2EE63C01")
        removeItemsFromArray(item: "Mac-9AE82516C7C6B903")
        removeItemsFromArray(item: "Mac-A5C67F76ED83108C")
        removeItemsFromArray(item: "Mac-AFD8A9D944EA4843")
        removeItemsFromArray(item: "Mac-B4831CEBD52A0C4C")
        removeItemsFromArray(item: "Mac-BE0E8AC46FE800CC")
        removeItemsFromArray(item: "Mac-C3EC7CD22292981F")
        removeItemsFromArray(item: "Mac-CAD6701F7CEA0921")
        removeItemsFromArray(item: "Mac-E43C1C25D4880AD6")
        removeItemsFromArray(item: "Mac-EE2EBD4B90B839A8")
        removeItemsFromArray(item: "Mac-F305150B0C7DEEEF")
        removeItemsFromArray(item: "Mac-F65AE981FFA204ED")
        removeItemsFromArray(item: "MacBook5,1")
        removeItemsFromArray(item: "MacBook5,2")
        removeItemsFromArray(item: "MacBook6,1")
        removeItemsFromArray(item: "MacBook7,1")
        removeItemsFromArray(item: "MacBookPro5,1")
        removeItemsFromArray(item: "MacBookPro5,2")
        removeItemsFromArray(item: "MacBookPro5,3")
        removeItemsFromArray(item: "MacBookPro5,4")
        removeItemsFromArray(item: "MacBookPro5,5")
        removeItemsFromArray(item: "MacBookPro6,1")
        removeItemsFromArray(item: "MacBookPro6,2")
        removeItemsFromArray(item: "MacBookPro7,1")
        removeItemsFromArray(item: "MacBookPro8,1")
        removeItemsFromArray(item: "MacBookPro8,2")
        removeItemsFromArray(item: "MacBookPro8,3")
        removeItemsFromArray(item: "Macmini3,1")
        removeItemsFromArray(item: "Macmini4,1")
        removeItemsFromArray(item: "Xserve3,1")
        removeItemsFromArray(item: "iMac9,1")
        renameItemInArray(olditem: "Mac-27ADBB7B4CEE8E61", newitem: "iMac14,2")
        renameItemInArray(olditem: "Mac-00BE6ED71E35EB86", newitem: "iMac13,1")
        renameItemInArray(olditem: "Mac-031B6874CF7F642A", newitem: "iMac14,1")
        renameItemInArray(olditem: "Mac-42FD25EABCABB274", newitem: "iMac15,1")
        renameItemInArray(olditem: "Mac-4B682C642B45593E", newitem: "iMac18,1")
        renameItemInArray(olditem: "Mac-77EB7D7DAF985301", newitem: "iMac14,3")
        renameItemInArray(olditem: "Mac-77F17D7DA9285301", newitem: "iMac18,2")
        renameItemInArray(olditem: "Mac-7BA5B2D9E42DDD94", newitem: "iMacPro1,1")
        renameItemInArray(olditem: "Mac-7DF2A3B5E5D671ED", newitem: "iMac13,3")
        renameItemInArray(olditem: "Mac-81E3E92DD6088272", newitem: "iMac14,4")
        renameItemInArray(olditem: "Mac-A369DDC4E67F1C45", newitem: "iMac16,1")
        renameItemInArray(olditem: "Mac-B809C3757DA9BB8D", newitem: "iMac17,1")
        renameItemInArray(olditem: "Mac-BE088AF8C5EB4FA2", newitem: "iMac18,3")
        renameItemInArray(olditem: "Mac-F60DEB81FF30ACF6", newitem: "MacPro6,1")
        renameItemInArray(olditem: "Mac-FA842E06C61E91C5", newitem: "iMac15,2")
        renameItemInArray(olditem: "Mac-FC02E91DDD3FA6A4", newitem: "iMac13,2")
        renameItemInArray(olditem: "Mac-FFE5EF870D7BA81A", newitem: "iMac16,2")
        
        let sortedArray = comboboxArray.sorted()
        
        popButton.removeAllItems()
        popButton.addItems(withTitles: sortedArray)
        popButton.selectItem(at: 0)
        yesChecked.state = NSControlStateValueOff
        
    }
    override var representedObject: Any? {
        didSet {
        }
    }
    @IBAction func generateButton(_ sender: Any) {
        func saveAlert () {
            let fileManager = FileManager.default
            let home = fileManager.homeDirectoryForCurrentUser
            let kextPath = "Desktop/AGPMInjector.kext"
            let kextUrl = home.appendingPathComponent(kextPath)
            let alert = NSAlert()
            alert.messageText = "Injector Kext Generation Complete!"
            alert.informativeText = "AGPMInjector.kext has been generated and saved to \(kextUrl.path)"
            alert.beginSheetModal(for: self.view.window!, completionHandler: nil)
        }
        
        func existAlert () {
            let fileManager = FileManager.default
            let home = fileManager.homeDirectoryForCurrentUser
            let kextPath = "Desktop/AGPMInjector.kext"
            let kextUrl = home.appendingPathComponent(kextPath)
            let alert = NSAlert()
            alert.alertStyle = .critical
            alert.addButton(withTitle: "Delete")
            alert.messageText = "File Already Exist!"
            alert.informativeText = "AGPMInjector.kext already exist at \(kextUrl.path). Click the Delete button to delete the existing file!"
            alert.beginSheetModal(for: self.view.window!, completionHandler: { (returnCode) -> Void in
                switch returnCode {
                case NSAlertFirstButtonReturn: do {
                    try fileManager.removeItem(at: kextUrl)
                }
                catch {
                    print(error.localizedDescription)
                    }
                default:
                    return
                }
            })
        }
        
        let getAGPMFilePathURL = URL.init(fileURLWithPath: getAGPMFilePath)
        plistEncoder.outputFormat = .xml
        // Decoder the AppleGraphicsPowerManagement.kext Info.plist and get some information to save as variable
        let data = try! Data(contentsOf: getAGPMFilePathURL)
        let plistData = try! plistDecoder.decode(PlistGet.self, from: data)
        let filePath =  tDocumentDirectory.appendingPathComponent("\(setAGPMInjectorDirectory)")
        // Create a object to represent the plist data to get encoded
        if popButton.titleOfSelectedItem == "iMacPro1,1" {
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
                let controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: filePath.path) {
                existAlert()
            } else {
                do {
                    try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                    let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                    let data = try plistEncoder.encode(plistToEncode)
                    try data.write(to: InfoPlistfilePath)
                    saveAlert()
                }
                catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        if popButton.titleOfSelectedItem == "MacPro5,1" {
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
                let controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0),controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: filePath.path) {
                existAlert()
            } else {
                do {
                    try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                    let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                    let data = try plistEncoder.encode(plistToEncode)
                    try data.write(to: InfoPlistfilePath)
                    saveAlert()
                }
                catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        if popButton.titleOfSelectedItem == "MacPro4,1" {
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
                let controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    
                    
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: filePath.path) {
                existAlert()
            } else {
                do {
                    try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                    let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                    let data = try plistEncoder.encode(plistToEncode)
                    try data.write(to: InfoPlistfilePath)
                    saveAlert()
                }
                catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        if popButton.titleOfSelectedItem == "MacPro6,1" {
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
                let controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: bundleReq)
            
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: filePath.path) {
                existAlert()
            } else {
                do {
                    try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                    let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                    let data = try plistEncoder.encode(plistToEncode)
                    try data.write(to: InfoPlistfilePath)
                    saveAlert()
                }
                catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        if popButton.titleOfSelectedItem == "iMac14,2" {
            if yesChecked.state == NSControlStateValueOff {
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
                    let controlID: Int
                    enum CodingKeys: String, CodingKey {
                        case agdcEnabled = "AGDCEnabled"
                        case Heuristic
                        
                        
                        case controlID = "control-id"
                    }
                }
                struct Heuristic: Codable {
                    let ID: Int
                }
                let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
                
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath.path) {
                    existAlert()
                } else {
                    do {
                        try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                        let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                        let data = try plistEncoder.encode(plistToEncode)
                        try data.write(to: InfoPlistfilePath)
                        saveAlert()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            } else {
                yesChecked.state = NSControlStateValueOn
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
                    let iMac142: IMac142
                    enum CodingKeys: String, CodingKey {
                        case iMac142 = "iMac14,2"
                    }
                }
                struct IMac142: Codable {
                    let igpu: HaswellIgpu
                    let GFX0: GFX0
                    enum CodingKeys: String, CodingKey {
                        case igpu = "IGPU"
                        case GFX0
                    }
                }
                struct GFX0: Codable {
                    let agdcEnabled: Int
                    let Heuristic: Heuristic
                    let controlID: Int
                    enum CodingKeys: String, CodingKey {
                        case agdcEnabled = "AGDCEnabled"
                        case Heuristic
                        
                        
                        case controlID = "control-id"
                    }
                }
                struct Heuristic: Codable {
                    let ID: Int
                }
                struct HaswellIgpu: Codable {
                    let heuristic: HaswellIGPUHeuristic
                    let controlID: Int
                    
                    enum CodingKeys: String, CodingKey {
                        case heuristic = "Heuristic"
                        case controlID = "control-id"
                    }
                }
                struct HaswellIGPUHeuristic: Codable {
                    let enableRingTableOverride: Int
                    let thresholdsForRingOverrideTable0, ringOverrideTable1: [Int]
                    let numOfRingTables, id: Int
                    let thresholdsForRingOverrideTable1: [Int]
                    let enableOverride: Int
                    let ringOverrideTable0: [Int]
                    let startingPstateForRingTableOverride, ioBusynessSamplingInterval: Int
                    let thresholdsForRingOverrideTable2: [Int]
                    let numOfRingTableOverride, numOfThresholdsForRingTables: Int
                    let ringOverrideTable2: [Int]
                    
                    enum CodingKeys: String, CodingKey {
                        case enableRingTableOverride = "EnableRingTableOverride"
                        case thresholdsForRingOverrideTable0 = "ThresholdsForRingOverrideTable0"
                        case ringOverrideTable1 = "RingOverrideTable1"
                        case numOfRingTables = "NumOfRingTables"
                        case id = "ID"
                        case thresholdsForRingOverrideTable1 = "ThresholdsForRingOverrideTable1"
                        case enableOverride = "EnableOverride"
                        case ringOverrideTable0 = "RingOverrideTable0"
                        case startingPstateForRingTableOverride = "StartingPstateForRingTableOverride"
                        case ioBusynessSamplingInterval = "IOBusynessSamplingInterval"
                        case thresholdsForRingOverrideTable2 = "ThresholdsForRingOverrideTable2"
                        case numOfRingTableOverride = "NumOfRingTableOverride"
                        case numOfThresholdsForRingTables = "NumOfThresholdsForRingTables"
                        case ringOverrideTable2 = "RingOverrideTable2"
                    }
                }
                
                let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(iMac142: IMac142(igpu: HaswellIgpu(heuristic: HaswellIGPUHeuristic(enableRingTableOverride: 1, thresholdsForRingOverrideTable0: [0,10], ringOverrideTable1: [16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16], numOfRingTables: 3, id: 2, thresholdsForRingOverrideTable1: [5,15], enableOverride: 0, ringOverrideTable0: [8,8,8,8,8,9,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10], startingPstateForRingTableOverride: 11, ioBusynessSamplingInterval: 1, thresholdsForRingOverrideTable2: [10,100], numOfRingTableOverride: 23, numOfThresholdsForRingTables: 2, ringOverrideTable2: [8,8,8,9,10,11,13,14,15,16,18,1920,21,23,24,25,26,28,29,30,31,33]), controlID: 16), GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
                
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath.path) {
                    existAlert()
                } else {
                    do {
                        try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                        let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                        let data = try plistEncoder.encode(plistToEncode)
                        try data.write(to: InfoPlistfilePath)
                        saveAlert()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        
        if popButton.titleOfSelectedItem == "iMac13,1" {
            if yesChecked.state == NSControlStateValueOff {
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
                    let controlID: Int
                    enum CodingKeys: String, CodingKey {
                        case agdcEnabled = "AGDCEnabled"
                        case Heuristic
                        
                        
                        case controlID = "control-id"
                    }
                }
                struct Heuristic: Codable {
                    let ID: Int
                }
                let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
                
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath.path) {
                    existAlert()
                } else {
                    do {
                        try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                        let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                        let data = try plistEncoder.encode(plistToEncode)
                        try data.write(to: InfoPlistfilePath)
                        saveAlert()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            } else {
                yesChecked.state = NSControlStateValueOn
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
                    let iMac131: IMac131
                    
                    enum CodingKeys: String, CodingKey {
                        case iMac131 = "iMac13,1"
                    }
                }
                struct IMac131: Codable {
                    let igpu: IvyBridgeIgpu
                    let GFX0: GFX0
                    
                    enum CodingKeys: String, CodingKey {
                        case igpu = "IGPU"
                        case GFX0
                    }
                }
                struct GFX0: Codable {
                    let agdcEnabled: Int
                    let Heuristic: Heuristic
                    let controlID: Int
                    enum CodingKeys: String, CodingKey {
                        case agdcEnabled = "AGDCEnabled"
                        case Heuristic
                        
                        
                        case controlID = "control-id"
                    }
                }
                struct Heuristic: Codable {
                    let ID: Int
                }
                struct IvyBridgeIgpu: Codable {
                    let heuristic: IvyBridgeIGPUHeuristic
                    let controlID: Int
                    
                    enum CodingKeys: String, CodingKey {
                        case heuristic = "Heuristic"
                        case controlID = "control-id"
                    }
                }
                
                struct IvyBridgeIGPUHeuristic: Codable {
                    let enableOverride, id: Int
                    
                    enum CodingKeys: String, CodingKey {
                        case enableOverride = "EnableOverride"
                        case id = "ID"
                    }
                }
                let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(iMac131: IMac131(igpu: IvyBridgeIgpu(heuristic: IvyBridgeIGPUHeuristic(enableOverride: 0, id: 2), controlID: 16), GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
                
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath.path) {
                    existAlert()
                } else {
                    do {
                        try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                        let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                        let data = try plistEncoder.encode(plistToEncode)
                        try data.write(to: InfoPlistfilePath)
                        saveAlert()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        
        if popButton.titleOfSelectedItem == "iMac14,1" {
            if yesChecked.state == NSControlStateValueOff {
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
                    let controlID: Int
                    enum CodingKeys: String, CodingKey {
                        case agdcEnabled = "AGDCEnabled"
                        case Heuristic
                        
                        
                        case controlID = "control-id"
                    }
                }
                struct Heuristic: Codable {
                    let ID: Int
                }
                let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
                
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath.path) {
                    existAlert()
                } else {
                    do {
                        try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                        let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                        let data = try plistEncoder.encode(plistToEncode)
                        try data.write(to: InfoPlistfilePath)
                        saveAlert()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            } else {
                yesChecked.state = NSControlStateValueOn
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
                    let iMac141: IMac141
                    enum CodingKeys: String, CodingKey {
                        case iMac141 = "iMac14,1"
                    }
                }
                struct IMac141: Codable {
                    let igpu: HaswellIgpu
                    let GFX0: GFX0
                    enum CodingKeys: String, CodingKey {
                        case igpu = "IGPU"
                        case GFX0
                    }
                }
                struct GFX0: Codable {
                    let agdcEnabled: Int
                    let Heuristic: Heuristic
                    let controlID: Int
                    enum CodingKeys: String, CodingKey {
                        case agdcEnabled = "AGDCEnabled"
                        case Heuristic
                        
                        
                        case controlID = "control-id"
                    }
                }
                struct Heuristic: Codable {
                    let ID: Int
                }
                struct HaswellIgpu: Codable {
                    let heuristic: HaswellIGPUHeuristic
                    let controlID: Int
                    
                    enum CodingKeys: String, CodingKey {
                        case heuristic = "Heuristic"
                        case controlID = "control-id"
                    }
                }
                struct HaswellIGPUHeuristic: Codable {
                    let enableRingTableOverride: Int
                    let thresholdsForRingOverrideTable0, ringOverrideTable1: [Int]
                    let numOfRingTables, id: Int
                    let thresholdsForRingOverrideTable1: [Int]
                    let enableOverride: Int
                    let ringOverrideTable0: [Int]
                    let startingPstateForRingTableOverride, ioBusynessSamplingInterval: Int
                    let thresholdsForRingOverrideTable2: [Int]
                    let numOfRingTableOverride, numOfThresholdsForRingTables: Int
                    let ringOverrideTable2: [Int]
                    
                    enum CodingKeys: String, CodingKey {
                        case enableRingTableOverride = "EnableRingTableOverride"
                        case thresholdsForRingOverrideTable0 = "ThresholdsForRingOverrideTable0"
                        case ringOverrideTable1 = "RingOverrideTable1"
                        case numOfRingTables = "NumOfRingTables"
                        case id = "ID"
                        case thresholdsForRingOverrideTable1 = "ThresholdsForRingOverrideTable1"
                        case enableOverride = "EnableOverride"
                        case ringOverrideTable0 = "RingOverrideTable0"
                        case startingPstateForRingTableOverride = "StartingPstateForRingTableOverride"
                        case ioBusynessSamplingInterval = "IOBusynessSamplingInterval"
                        case thresholdsForRingOverrideTable2 = "ThresholdsForRingOverrideTable2"
                        case numOfRingTableOverride = "NumOfRingTableOverride"
                        case numOfThresholdsForRingTables = "NumOfThresholdsForRingTables"
                        case ringOverrideTable2 = "RingOverrideTable2"
                    }
                }
                
                let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(iMac141: IMac141(igpu: HaswellIgpu(heuristic: HaswellIGPUHeuristic(enableRingTableOverride: 1, thresholdsForRingOverrideTable0: [0,10], ringOverrideTable1: [16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16], numOfRingTables: 3, id: 2, thresholdsForRingOverrideTable1: [5,15], enableOverride: 0, ringOverrideTable0: [8,8,8,8,8,9,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10], startingPstateForRingTableOverride: 11, ioBusynessSamplingInterval: 1, thresholdsForRingOverrideTable2: [10,100], numOfRingTableOverride: 23, numOfThresholdsForRingTables: 2, ringOverrideTable2: [8,8,8,9,10,11,13,14,15,16,18,1920,21,23,24,25,26,28,29,30,31,33]), controlID: 16), GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
                
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath.path) {
                    existAlert()
                } else {
                    do {
                        try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                        let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                        let data = try plistEncoder.encode(plistToEncode)
                        try data.write(to: InfoPlistfilePath)
                        saveAlert()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        
        if popButton.titleOfSelectedItem == "iMac15,1" {
            if yesChecked.state == NSControlStateValueOff {
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
                    let controlID: Int
                    enum CodingKeys: String, CodingKey {
                        case agdcEnabled = "AGDCEnabled"
                        case Heuristic
                        
                        
                        case controlID = "control-id"
                    }
                }
                struct Heuristic: Codable {
                    let ID: Int
                }
                let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
                
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath.path) {
                    existAlert()
                } else {
                    do {
                        try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                        let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                        let data = try plistEncoder.encode(plistToEncode)
                        try data.write(to: InfoPlistfilePath)
                        saveAlert()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            } else {
                yesChecked.state = NSControlStateValueOn
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
                    let iMac151: IMac151
                    enum CodingKeys: String, CodingKey {
                        case iMac151 = "iMac15,1"
                    }
                }
                struct IMac151: Codable {
                    let igpu: HaswellIgpu
                    let GFX0: GFX0
                    enum CodingKeys: String, CodingKey {
                        case igpu = "IGPU"
                        case GFX0
                    }
                }
                struct GFX0: Codable {
                    let agdcEnabled: Int
                    let Heuristic: Heuristic
                    let controlID: Int
                    enum CodingKeys: String, CodingKey {
                        case agdcEnabled = "AGDCEnabled"
                        case Heuristic
                        
                        
                        case controlID = "control-id"
                    }
                }
                struct Heuristic: Codable {
                    let ID: Int
                }
                struct HaswellIgpu: Codable {
                    let heuristic: HaswellIGPUHeuristic
                    let controlID: Int
                    
                    enum CodingKeys: String, CodingKey {
                        case heuristic = "Heuristic"
                        case controlID = "control-id"
                    }
                }
                struct HaswellIGPUHeuristic: Codable {
                    let enableRingTableOverride: Int
                    let thresholdsForRingOverrideTable0, ringOverrideTable1: [Int]
                    let numOfRingTables, id: Int
                    let thresholdsForRingOverrideTable1: [Int]
                    let enableOverride: Int
                    let ringOverrideTable0: [Int]
                    let startingPstateForRingTableOverride, ioBusynessSamplingInterval: Int
                    let thresholdsForRingOverrideTable2: [Int]
                    let numOfRingTableOverride, numOfThresholdsForRingTables: Int
                    let ringOverrideTable2: [Int]
                    
                    enum CodingKeys: String, CodingKey {
                        case enableRingTableOverride = "EnableRingTableOverride"
                        case thresholdsForRingOverrideTable0 = "ThresholdsForRingOverrideTable0"
                        case ringOverrideTable1 = "RingOverrideTable1"
                        case numOfRingTables = "NumOfRingTables"
                        case id = "ID"
                        case thresholdsForRingOverrideTable1 = "ThresholdsForRingOverrideTable1"
                        case enableOverride = "EnableOverride"
                        case ringOverrideTable0 = "RingOverrideTable0"
                        case startingPstateForRingTableOverride = "StartingPstateForRingTableOverride"
                        case ioBusynessSamplingInterval = "IOBusynessSamplingInterval"
                        case thresholdsForRingOverrideTable2 = "ThresholdsForRingOverrideTable2"
                        case numOfRingTableOverride = "NumOfRingTableOverride"
                        case numOfThresholdsForRingTables = "NumOfThresholdsForRingTables"
                        case ringOverrideTable2 = "RingOverrideTable2"
                    }
                }
                
                let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(iMac151: IMac151(igpu: HaswellIgpu(heuristic: HaswellIGPUHeuristic(enableRingTableOverride: 1, thresholdsForRingOverrideTable0: [0,10], ringOverrideTable1: [16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16], numOfRingTables: 3, id: 2, thresholdsForRingOverrideTable1: [5,15], enableOverride: 0, ringOverrideTable0: [8,8,8,8,8,9,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10], startingPstateForRingTableOverride: 11, ioBusynessSamplingInterval: 1, thresholdsForRingOverrideTable2: [10,100], numOfRingTableOverride: 23, numOfThresholdsForRingTables: 2, ringOverrideTable2: [8,8,8,9,10,11,13,14,15,16,18,1920,21,23,24,25,26,28,29,30,31,33]), controlID: 16), GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
                
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath.path) {
                    existAlert()
                } else {
                    do {
                        try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                        let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                        let data = try plistEncoder.encode(plistToEncode)
                        try data.write(to: InfoPlistfilePath)
                        saveAlert()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        
        if popButton.titleOfSelectedItem == "iMac18,1" {
            if yesChecked.state == NSControlStateValueOff {
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
                    let controlID: Int
                    enum CodingKeys: String, CodingKey {
                        case agdcEnabled = "AGDCEnabled"
                        case Heuristic
                        
                        
                        case controlID = "control-id"
                    }
                }
                struct Heuristic: Codable {
                    let ID: Int
                }
                let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
                
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath.path) {
                    existAlert()
                } else {
                    do {
                        try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                        let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                        let data = try plistEncoder.encode(plistToEncode)
                        try data.write(to: InfoPlistfilePath)
                        saveAlert()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            } else {
                yesChecked.state = NSControlStateValueOn
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
                    let iMac181: IMac181
                    
                    enum CodingKeys: String, CodingKey {
                        case iMac181 = "iMac18,1"
                    }
                }
                struct IMac181: Codable {
                    let igpu: kabylakeIgpu
                    let GFX0: GFX0
                    
                    enum CodingKeys: String, CodingKey {
                        case igpu = "IGPU"
                        case GFX0
                    }
                }
                struct GFX0: Codable {
                    let agdcEnabled: Int
                    let Heuristic: Heuristic
                    let controlID: Int
                    enum CodingKeys: String, CodingKey {
                        case agdcEnabled = "AGDCEnabled"
                        case Heuristic
                        
                        
                        case controlID = "control-id"
                    }
                }
                struct Heuristic: Codable {
                    let ID: Int
                }
                struct kabylakeIgpu: Codable {
                    let boostPState: [Int]
                    let heuristic: kabylakeHeuristic
                    let sliceControl, controlID: Int
                    let boostTime: [Int]
                    
                    enum CodingKeys: String, CodingKey {
                        case boostPState = "BoostPState"
                        case heuristic = "Heuristic"
                        case sliceControl = "SliceControl"
                        case controlID = "control-id"
                        case boostTime = "BoostTime"
                    }
                }
                
                struct kabylakeHeuristic: Codable {
                    let thresholdsForRingOverrideTable2, thresholdsForRingOverrideTable1, thresholdsForRingOverrideTable0: [Int]
                    let evaluateUpInterval, downStep, gt3Floor, numOfRingTableOverride: Int
                    let cpgControl: CPGControl
                    let ringOverrideTable2: [Int]
                    let startingPstateForRingTableOverride, ioBusynessSamplingInterval, enableOverride: Int
                    let ringOverrideTable1: [Int]
                    let upStep, busyUpThresholdPercent, gt2Floor: Int
                    let rCxControl: RCxControl
                    let numOfThresholdsForRingTables, busyDownThresholdPercent, id: Int
                    let ringOverrideTable0: [Int]
                    let numOfRingTables, sampleInterval, evaluateDownInterval, enableRingTableOverride: Int
                    
                    enum CodingKeys: String, CodingKey {
                        case thresholdsForRingOverrideTable2 = "ThresholdsForRingOverrideTable2"
                        case thresholdsForRingOverrideTable1 = "ThresholdsForRingOverrideTable1"
                        case thresholdsForRingOverrideTable0 = "ThresholdsForRingOverrideTable0"
                        case evaluateUpInterval = "EvaluateUpInterval"
                        case downStep = "DownStep"
                        case gt3Floor = "GT3Floor"
                        case numOfRingTableOverride = "NumOfRingTableOverride"
                        case cpgControl = "CPGControl"
                        case ringOverrideTable2 = "RingOverrideTable2"
                        case startingPstateForRingTableOverride = "StartingPstateForRingTableOverride"
                        case ioBusynessSamplingInterval = "IOBusynessSamplingInterval"
                        case enableOverride = "EnableOverride"
                        case ringOverrideTable1 = "RingOverrideTable1"
                        case upStep = "UpStep"
                        case busyUpThresholdPercent = "BusyUpThresholdPercent"
                        case gt2Floor = "GT2Floor"
                        case rCxControl = "RCxControl"
                        case numOfThresholdsForRingTables = "NumOfThresholdsForRingTables"
                        case busyDownThresholdPercent = "BusyDownThresholdPercent"
                        case id = "ID"
                        case ringOverrideTable0 = "RingOverrideTable0"
                        case numOfRingTables = "NumOfRingTables"
                        case sampleInterval
                        case evaluateDownInterval = "EvaluateDownInterval"
                        case enableRingTableOverride = "EnableRingTableOverride"
                    }
                }
                
                struct CPGControl: Codable {
                    let mediaHysteresis, wakeLimit, renderHysteresis: Int
                    
                    enum CodingKeys: String, CodingKey {
                        case mediaHysteresis = "MediaHysteresis"
                        case wakeLimit = "Wake_Limit"
                        case renderHysteresis = "RenderHysteresis"
                    }
                }
                
                struct RCxControl: Codable {
                    let rc6WakeLimit, rc6Threshold, rpIdleHysteresis, rcEvalInterval: Int
                    
                    enum CodingKeys: String, CodingKey {
                        case rc6WakeLimit = "RC6_Wake_Limit"
                        case rc6Threshold = "RC6_Threshold"
                        case rpIdleHysteresis = "RP_Idle_Hysteresis"
                        case rcEvalInterval = "RC_Eval_Interval"
                    }
                }
                let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(iMac181: IMac181(igpu: kabylakeIgpu(boostPState: [24,24,24,24], heuristic: kabylakeHeuristic(thresholdsForRingOverrideTable2: [10,100], thresholdsForRingOverrideTable1: [5,15], thresholdsForRingOverrideTable0: [0,10], evaluateUpInterval: 31250, downStep: 1, gt3Floor: 17, numOfRingTableOverride: 23, cpgControl: CPGControl(mediaHysteresis: 32, wakeLimit: 80, renderHysteresis: 200), ringOverrideTable2: [9,11,12,14,15,17,18,20,21,23,24,26,27,29,30,32,33,35,36,38,39,41,42], startingPstateForRingTableOverride: 11, ioBusynessSamplingInterval: 1, enableOverride: 1, ringOverrideTable1: [9,11,12,14,15,17,18,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19], upStep: 1, busyUpThresholdPercent: 70, gt2Floor: 14, rCxControl: RCxControl(rc6WakeLimit: 40, rc6Threshold: 520, rpIdleHysteresis: 25, rcEvalInterval: 40000), numOfThresholdsForRingTables: 2, busyDownThresholdPercent: 50, id: 2, ringOverrideTable0: [8,8,8,8,8,9,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10], numOfRingTables: 3, sampleInterval: 1000, evaluateDownInterval: 31250, enableRingTableOverride: 1), sliceControl: 1, controlID: 16, boostTime: [1,1,1,15]), GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
                
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath.path) {
                    existAlert()
                } else {
                    do {
                        try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                        let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                        let data = try plistEncoder.encode(plistToEncode)
                        try data.write(to: InfoPlistfilePath)
                        saveAlert()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        
        if popButton.titleOfSelectedItem == "iMac17,1" {
            if yesChecked.state == NSControlStateValueOff {
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
                    let controlID: Int
                    enum CodingKeys: String, CodingKey {
                        case agdcEnabled = "AGDCEnabled"
                        case Heuristic
                        
                        
                        case controlID = "control-id"
                    }
                }
                struct Heuristic: Codable {
                    let ID: Int
                }
                let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
                
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath.path) {
                    existAlert()
                } else {
                    do {
                        try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                        let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                        let data = try plistEncoder.encode(plistToEncode)
                        try data.write(to: InfoPlistfilePath)
                        saveAlert()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            } else {
                yesChecked.state = NSControlStateValueOn
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
                    let iMac171: IMac171
                    
                    enum CodingKeys: String, CodingKey {
                        case iMac171 = "iMac17,1"
                    }
                }
                struct IMac171: Codable {
                    let igpu: SkylakeIgpu
                    let GFX0: GFX0
                    enum CodingKeys: String, CodingKey {
                        case igpu = "IGPU"
                        case GFX0
                    }
                }
                struct GFX0: Codable {
                    let agdcEnabled: Int
                    let Heuristic: Heuristic
                    let controlID: Int
                    enum CodingKeys: String, CodingKey {
                        case agdcEnabled = "AGDCEnabled"
                        case Heuristic
                        
                        
                        case controlID = "control-id"
                    }
                }
                struct Heuristic: Codable {
                    let ID: Int
                }
                struct SkylakeIgpu: Codable {
                    let heuristic: SkylakeIGPUHeuristic
                    let controlID: Int
                    
                    enum CodingKeys: String, CodingKey {
                        case heuristic = "Heuristic"
                        case controlID = "control-id"
                    }
                }
                
                struct SkylakeIGPUHeuristic: Codable {
                    let enableOverride, id: Int
                    
                    enum CodingKeys: String, CodingKey {
                        case enableOverride = "EnableOverride"
                        case id = "ID"
                    }
                }
                let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(iMac171: IMac171(igpu: SkylakeIgpu(heuristic: SkylakeIGPUHeuristic(enableOverride: 0, id: 2), controlID: 16), GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
                
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath.path) {
                    existAlert()
                } else {
                    do {
                        try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                        let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                        let data = try plistEncoder.encode(plistToEncode)
                        try data.write(to: InfoPlistfilePath)
                        saveAlert()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        
        if popButton.titleOfSelectedItem == "iMac14,3" {
            if yesChecked.state == NSControlStateValueOff {
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
                    let controlID: Int
                    enum CodingKeys: String, CodingKey {
                        case agdcEnabled = "AGDCEnabled"
                        case Heuristic
                        
                        
                        case controlID = "control-id"
                    }
                }
                struct Heuristic: Codable {
                    let ID: Int
                }
                let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
                
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath.path) {
                    existAlert()
                } else {
                    do {
                        try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                        let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                        let data = try plistEncoder.encode(plistToEncode)
                        try data.write(to: InfoPlistfilePath)
                        saveAlert()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            } else {
                yesChecked.state = NSControlStateValueOn
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
                    let iMac143: IMac143
                    enum CodingKeys: String, CodingKey {
                        case iMac143 = "iMac14,3"
                    }
                }
                struct IMac143: Codable {
                    let igpu: HaswellIgpu
                    let GFX0: GFX0
                    enum CodingKeys: String, CodingKey {
                        case igpu = "IGPU"
                        case GFX0
                    }
                }
                struct GFX0: Codable {
                    let agdcEnabled: Int
                    let Heuristic: Heuristic
                    let controlID: Int
                    enum CodingKeys: String, CodingKey {
                        case agdcEnabled = "AGDCEnabled"
                        case Heuristic
                        
                        
                        case controlID = "control-id"
                    }
                }
                struct Heuristic: Codable {
                    let ID: Int
                }
                struct HaswellIgpu: Codable {
                    let heuristic: HaswellIGPUHeuristic
                    let controlID: Int
                    
                    enum CodingKeys: String, CodingKey {
                        case heuristic = "Heuristic"
                        case controlID = "control-id"
                    }
                }
                struct HaswellIGPUHeuristic: Codable {
                    let enableRingTableOverride: Int
                    let thresholdsForRingOverrideTable0, ringOverrideTable1: [Int]
                    let numOfRingTables, id: Int
                    let thresholdsForRingOverrideTable1: [Int]
                    let enableOverride: Int
                    let ringOverrideTable0: [Int]
                    let startingPstateForRingTableOverride, ioBusynessSamplingInterval: Int
                    let thresholdsForRingOverrideTable2: [Int]
                    let numOfRingTableOverride, numOfThresholdsForRingTables: Int
                    let ringOverrideTable2: [Int]
                    
                    enum CodingKeys: String, CodingKey {
                        case enableRingTableOverride = "EnableRingTableOverride"
                        case thresholdsForRingOverrideTable0 = "ThresholdsForRingOverrideTable0"
                        case ringOverrideTable1 = "RingOverrideTable1"
                        case numOfRingTables = "NumOfRingTables"
                        case id = "ID"
                        case thresholdsForRingOverrideTable1 = "ThresholdsForRingOverrideTable1"
                        case enableOverride = "EnableOverride"
                        case ringOverrideTable0 = "RingOverrideTable0"
                        case startingPstateForRingTableOverride = "StartingPstateForRingTableOverride"
                        case ioBusynessSamplingInterval = "IOBusynessSamplingInterval"
                        case thresholdsForRingOverrideTable2 = "ThresholdsForRingOverrideTable2"
                        case numOfRingTableOverride = "NumOfRingTableOverride"
                        case numOfThresholdsForRingTables = "NumOfThresholdsForRingTables"
                        case ringOverrideTable2 = "RingOverrideTable2"
                    }
                }
                
                let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(iMac143: IMac143(igpu: HaswellIgpu(heuristic: HaswellIGPUHeuristic(enableRingTableOverride: 1, thresholdsForRingOverrideTable0: [0,10], ringOverrideTable1: [16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16], numOfRingTables: 3, id: 2, thresholdsForRingOverrideTable1: [5,15], enableOverride: 0, ringOverrideTable0: [8,8,8,8,8,9,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10], startingPstateForRingTableOverride: 11, ioBusynessSamplingInterval: 1, thresholdsForRingOverrideTable2: [10,100], numOfRingTableOverride: 23, numOfThresholdsForRingTables: 2, ringOverrideTable2: [8,8,8,9,10,11,13,14,15,16,18,1920,21,23,24,25,26,28,29,30,31,33]), controlID: 16), GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
                
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath.path) {
                    existAlert()
                } else {
                    do {
                        try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                        let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                        let data = try plistEncoder.encode(plistToEncode)
                        try data.write(to: InfoPlistfilePath)
                        saveAlert()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        
        if popButton.titleOfSelectedItem == "iMac18,2" {
            if yesChecked.state == NSControlStateValueOff {
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
                    let controlID: Int
                    enum CodingKeys: String, CodingKey {
                        case agdcEnabled = "AGDCEnabled"
                        case Heuristic
                        
                        
                        case controlID = "control-id"
                    }
                }
                struct Heuristic: Codable {
                    let ID: Int
                }
                let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
                
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath.path) {
                    existAlert()
                } else {
                    do {
                        try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                        let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                        let data = try plistEncoder.encode(plistToEncode)
                        try data.write(to: InfoPlistfilePath)
                        saveAlert()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            } else {
                yesChecked.state = NSControlStateValueOn
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
                    let iMac182: IMac182
                    
                    enum CodingKeys: String, CodingKey {
                        case iMac182 = "iMac18,2"
                    }
                }
                struct IMac182: Codable {
                    let igpu: kabylakeIgpu
                    let GFX0: GFX0
                    
                    enum CodingKeys: String, CodingKey {
                        case igpu = "IGPU"
                        case GFX0
                    }
                }
                struct GFX0: Codable {
                    let agdcEnabled: Int
                    let Heuristic: Heuristic
                    let controlID: Int
                    enum CodingKeys: String, CodingKey {
                        case agdcEnabled = "AGDCEnabled"
                        case Heuristic
                        
                        
                        case controlID = "control-id"
                    }
                }
                struct Heuristic: Codable {
                    let ID: Int
                }
                struct kabylakeIgpu: Codable {
                    let boostPState: [Int]
                    let heuristic: kabylakeHeuristic
                    let sliceControl, controlID: Int
                    let boostTime: [Int]
                    
                    enum CodingKeys: String, CodingKey {
                        case boostPState = "BoostPState"
                        case heuristic = "Heuristic"
                        case sliceControl = "SliceControl"
                        case controlID = "control-id"
                        case boostTime = "BoostTime"
                    }
                }
                
                struct kabylakeHeuristic: Codable {
                    let thresholdsForRingOverrideTable2, thresholdsForRingOverrideTable1, thresholdsForRingOverrideTable0: [Int]
                    let evaluateUpInterval, downStep, gt3Floor, numOfRingTableOverride: Int
                    let cpgControl: CPGControl
                    let ringOverrideTable2: [Int]
                    let startingPstateForRingTableOverride, ioBusynessSamplingInterval, enableOverride: Int
                    let ringOverrideTable1: [Int]
                    let upStep, busyUpThresholdPercent, gt2Floor: Int
                    let rCxControl: RCxControl
                    let numOfThresholdsForRingTables, busyDownThresholdPercent, id: Int
                    let ringOverrideTable0: [Int]
                    let numOfRingTables, sampleInterval, evaluateDownInterval, enableRingTableOverride: Int
                    
                    enum CodingKeys: String, CodingKey {
                        case thresholdsForRingOverrideTable2 = "ThresholdsForRingOverrideTable2"
                        case thresholdsForRingOverrideTable1 = "ThresholdsForRingOverrideTable1"
                        case thresholdsForRingOverrideTable0 = "ThresholdsForRingOverrideTable0"
                        case evaluateUpInterval = "EvaluateUpInterval"
                        case downStep = "DownStep"
                        case gt3Floor = "GT3Floor"
                        case numOfRingTableOverride = "NumOfRingTableOverride"
                        case cpgControl = "CPGControl"
                        case ringOverrideTable2 = "RingOverrideTable2"
                        case startingPstateForRingTableOverride = "StartingPstateForRingTableOverride"
                        case ioBusynessSamplingInterval = "IOBusynessSamplingInterval"
                        case enableOverride = "EnableOverride"
                        case ringOverrideTable1 = "RingOverrideTable1"
                        case upStep = "UpStep"
                        case busyUpThresholdPercent = "BusyUpThresholdPercent"
                        case gt2Floor = "GT2Floor"
                        case rCxControl = "RCxControl"
                        case numOfThresholdsForRingTables = "NumOfThresholdsForRingTables"
                        case busyDownThresholdPercent = "BusyDownThresholdPercent"
                        case id = "ID"
                        case ringOverrideTable0 = "RingOverrideTable0"
                        case numOfRingTables = "NumOfRingTables"
                        case sampleInterval
                        case evaluateDownInterval = "EvaluateDownInterval"
                        case enableRingTableOverride = "EnableRingTableOverride"
                    }
                }
                
                struct CPGControl: Codable {
                    let mediaHysteresis, wakeLimit, renderHysteresis: Int
                    
                    enum CodingKeys: String, CodingKey {
                        case mediaHysteresis = "MediaHysteresis"
                        case wakeLimit = "Wake_Limit"
                        case renderHysteresis = "RenderHysteresis"
                    }
                }
                
                struct RCxControl: Codable {
                    let rc6WakeLimit, rc6Threshold, rpIdleHysteresis, rcEvalInterval: Int
                    
                    enum CodingKeys: String, CodingKey {
                        case rc6WakeLimit = "RC6_Wake_Limit"
                        case rc6Threshold = "RC6_Threshold"
                        case rpIdleHysteresis = "RP_Idle_Hysteresis"
                        case rcEvalInterval = "RC_Eval_Interval"
                    }
                }
                let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(iMac182: IMac182(igpu: kabylakeIgpu(boostPState: [24,24,24,24], heuristic: kabylakeHeuristic(thresholdsForRingOverrideTable2: [10,100], thresholdsForRingOverrideTable1: [5,15], thresholdsForRingOverrideTable0: [0,10], evaluateUpInterval: 31250, downStep: 1, gt3Floor: 17, numOfRingTableOverride: 23, cpgControl: CPGControl(mediaHysteresis: 32, wakeLimit: 80, renderHysteresis: 200), ringOverrideTable2: [9,11,12,14,15,17,18,20,21,23,24,26,27,29,30,32,33,35,36,38,39,41,42], startingPstateForRingTableOverride: 11, ioBusynessSamplingInterval: 1, enableOverride: 1, ringOverrideTable1: [9,11,12,14,15,17,18,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19], upStep: 1, busyUpThresholdPercent: 70, gt2Floor: 14, rCxControl: RCxControl(rc6WakeLimit: 40, rc6Threshold: 520, rpIdleHysteresis: 25, rcEvalInterval: 40000), numOfThresholdsForRingTables: 2, busyDownThresholdPercent: 50, id: 2, ringOverrideTable0: [8,8,8,8,8,9,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10], numOfRingTables: 3, sampleInterval: 1000, evaluateDownInterval: 31250, enableRingTableOverride: 1), sliceControl: 1, controlID: 16, boostTime: [1,1,1,15]), GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
                
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath.path) {
                    existAlert()
                } else {
                    do {
                        try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                        let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                        let data = try plistEncoder.encode(plistToEncode)
                        try data.write(to: InfoPlistfilePath)
                        saveAlert()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        
        if popButton.titleOfSelectedItem == "iMac13,3" {
            if yesChecked.state == NSControlStateValueOff {
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
                    let controlID: Int
                    enum CodingKeys: String, CodingKey {
                        case agdcEnabled = "AGDCEnabled"
                        case Heuristic
                        
                        
                        case controlID = "control-id"
                    }
                }
                struct Heuristic: Codable {
                    let ID: Int
                }
                let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
                
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath.path) {
                    existAlert()
                } else {
                    do {
                        try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                        let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                        let data = try plistEncoder.encode(plistToEncode)
                        try data.write(to: InfoPlistfilePath)
                        saveAlert()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            } else {
                yesChecked.state = NSControlStateValueOn
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
                    let iMac133: IMac133
                    
                    enum CodingKeys: String, CodingKey {
                        case iMac133 = "iMac13,3"
                    }
                }
                struct IMac133: Codable {
                    let igpu: IvyBridgeIgpu
                    let GFX0: GFX0
                    
                    enum CodingKeys: String, CodingKey {
                        case igpu = "IGPU"
                        case GFX0
                    }
                }
                struct GFX0: Codable {
                    let agdcEnabled: Int
                    let Heuristic: Heuristic
                    let controlID: Int
                    enum CodingKeys: String, CodingKey {
                        case agdcEnabled = "AGDCEnabled"
                        case Heuristic
                        
                        
                        case controlID = "control-id"
                    }
                }
                struct Heuristic: Codable {
                    let ID: Int
                }
                struct IvyBridgeIgpu: Codable {
                    let heuristic: IvyBridgeIGPUHeuristic
                    let controlID: Int
                    
                    enum CodingKeys: String, CodingKey {
                        case heuristic = "Heuristic"
                        case controlID = "control-id"
                    }
                }
                
                struct IvyBridgeIGPUHeuristic: Codable {
                    let enableOverride, id: Int
                    
                    enum CodingKeys: String, CodingKey {
                        case enableOverride = "EnableOverride"
                        case id = "ID"
                    }
                }
                let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(iMac133: IMac133(igpu: IvyBridgeIgpu(heuristic: IvyBridgeIGPUHeuristic(enableOverride: 0, id: 2), controlID: 16), GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
                
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath.path) {
                    existAlert()
                } else {
                    do {
                        try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                        let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                        let data = try plistEncoder.encode(plistToEncode)
                        try data.write(to: InfoPlistfilePath)
                        saveAlert()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        
        if popButton.titleOfSelectedItem == "iMac14,4" {
            if yesChecked.state == NSControlStateValueOff {
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
                    let controlID: Int
                    enum CodingKeys: String, CodingKey {
                        case agdcEnabled = "AGDCEnabled"
                        case Heuristic
                        
                        
                        case controlID = "control-id"
                    }
                }
                struct Heuristic: Codable {
                    let ID: Int
                }
                let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
                
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath.path) {
                    existAlert()
                } else {
                    do {
                        try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                        let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                        let data = try plistEncoder.encode(plistToEncode)
                        try data.write(to: InfoPlistfilePath)
                        saveAlert()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            } else {
                yesChecked.state = NSControlStateValueOn
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
                    let iMac144: IMac144
                    enum CodingKeys: String, CodingKey {
                        case iMac144 = "iMac14,4"
                    }
                }
                struct IMac144: Codable {
                    let igpu: HaswellIgpu
                    let GFX0: GFX0
                    enum CodingKeys: String, CodingKey {
                        case igpu = "IGPU"
                        case GFX0
                    }
                }
                struct GFX0: Codable {
                    let agdcEnabled: Int
                    let Heuristic: Heuristic
                    let controlID: Int
                    enum CodingKeys: String, CodingKey {
                        case agdcEnabled = "AGDCEnabled"
                        case Heuristic
                        
                        
                        case controlID = "control-id"
                    }
                }
                struct Heuristic: Codable {
                    let ID: Int
                }
                struct HaswellIgpu: Codable {
                    let heuristic: HaswellIGPUHeuristic
                    let controlID: Int
                    
                    enum CodingKeys: String, CodingKey {
                        case heuristic = "Heuristic"
                        case controlID = "control-id"
                    }
                }
                struct HaswellIGPUHeuristic: Codable {
                    let enableRingTableOverride: Int
                    let thresholdsForRingOverrideTable0, ringOverrideTable1: [Int]
                    let numOfRingTables, id: Int
                    let thresholdsForRingOverrideTable1: [Int]
                    let enableOverride: Int
                    let ringOverrideTable0: [Int]
                    let startingPstateForRingTableOverride, ioBusynessSamplingInterval: Int
                    let thresholdsForRingOverrideTable2: [Int]
                    let numOfRingTableOverride, numOfThresholdsForRingTables: Int
                    let ringOverrideTable2: [Int]
                    
                    enum CodingKeys: String, CodingKey {
                        case enableRingTableOverride = "EnableRingTableOverride"
                        case thresholdsForRingOverrideTable0 = "ThresholdsForRingOverrideTable0"
                        case ringOverrideTable1 = "RingOverrideTable1"
                        case numOfRingTables = "NumOfRingTables"
                        case id = "ID"
                        case thresholdsForRingOverrideTable1 = "ThresholdsForRingOverrideTable1"
                        case enableOverride = "EnableOverride"
                        case ringOverrideTable0 = "RingOverrideTable0"
                        case startingPstateForRingTableOverride = "StartingPstateForRingTableOverride"
                        case ioBusynessSamplingInterval = "IOBusynessSamplingInterval"
                        case thresholdsForRingOverrideTable2 = "ThresholdsForRingOverrideTable2"
                        case numOfRingTableOverride = "NumOfRingTableOverride"
                        case numOfThresholdsForRingTables = "NumOfThresholdsForRingTables"
                        case ringOverrideTable2 = "RingOverrideTable2"
                    }
                }
                
                let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(iMac144: IMac144(igpu: HaswellIgpu(heuristic: HaswellIGPUHeuristic(enableRingTableOverride: 1, thresholdsForRingOverrideTable0: [0,10], ringOverrideTable1: [16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16], numOfRingTables: 3, id: 2, thresholdsForRingOverrideTable1: [5,15], enableOverride: 0, ringOverrideTable0: [8,8,8,8,8,9,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10], startingPstateForRingTableOverride: 11, ioBusynessSamplingInterval: 1, thresholdsForRingOverrideTable2: [10,100], numOfRingTableOverride: 23, numOfThresholdsForRingTables: 2, ringOverrideTable2: [8,8,8,9,10,11,13,14,15,16,18,1920,21,23,24,25,26,28,29,30,31,33]), controlID: 16), GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
                
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath.path) {
                    existAlert()
                } else {
                    do {
                        try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                        let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                        let data = try plistEncoder.encode(plistToEncode)
                        try data.write(to: InfoPlistfilePath)
                        saveAlert()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        
        if popButton.titleOfSelectedItem == "iMac16,1" {
            if yesChecked.state == NSControlStateValueOff {
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
                    let controlID: Int
                    enum CodingKeys: String, CodingKey {
                        case agdcEnabled = "AGDCEnabled"
                        case Heuristic
                        case controlID = "control-id"
                    }
                }
                struct Heuristic: Codable {
                    let ID: Int
                }
                let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
                
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath.path) {
                    existAlert()
                } else {
                    do {
                        try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                        let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                        let data = try plistEncoder.encode(plistToEncode)
                        try data.write(to: InfoPlistfilePath)
                        saveAlert()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            } else {
                yesChecked.state = NSControlStateValueOn
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
                    let iMac161: IMac161
                    
                    enum CodingKeys: String, CodingKey {
                        case iMac161 = "iMac16,1"
                    }
                }
                struct IMac161: Codable {
                    let igpu: BroadwellIgpu
                    let GFX0: GFX0
                    
                    enum CodingKeys: String, CodingKey {
                        case igpu = "IGPU"
                        case GFX0
                    }
                }
                struct GFX0: Codable {
                    let agdcEnabled: Int
                    let Heuristic: Heuristic
                    let controlID: Int
                    enum CodingKeys: String, CodingKey {
                        case agdcEnabled = "AGDCEnabled"
                        case Heuristic
                        
                        
                        case controlID = "control-id"
                    }
                }
                struct Heuristic: Codable {
                    let ID: Int
                }
                struct BroadwellIgpu: Codable {
                    let boostPState: [Int]
                    let heuristic: BroadwellHeuristic
                    let sliceControl, gt3Capped, maxPowerState, controlID: Int
                    let boostTime: [Int]
                    
                    enum CodingKeys: String, CodingKey {
                        case boostPState = "BoostPState"
                        case heuristic = "Heuristic"
                        case sliceControl = "SliceControl"
                        case gt3Capped = "GT3Capped"
                        case maxPowerState = "max-power-state"
                        case controlID = "control-id"
                        case boostTime = "BoostTime"
                    }
                }
                struct BroadwellHeuristic: Codable {
                    let thresholdsForRingOverrideTable2, thresholdsForRingOverrideTable1, thresholdsForRingOverrideTable0: [Int]
                    let evaluateUpInterval, downStep, gt3Floor, startingPstateForRingTableOverride: Int
                    let ringOverrideTable2: [Int]
                    let numOfRingTableOverride, ioBusynessSamplingInterval, enableOverride, upStep: Int
                    let ringOverrideTable1: [Int]
                    let busyUpThresholdPercent, gt2Floor, id, busyDownThresholdPercent: Int
                    let ringOverrideTable0: [Int]
                    let numOfThresholdsForRingTables, numOfRingTables, sampleInterval, evaluateDownInterval: Int
                    let enableRingTableOverride: Int
                    enum CodingKeys: String, CodingKey {
                        case thresholdsForRingOverrideTable2 = "ThresholdsForRingOverrideTable2"
                        case thresholdsForRingOverrideTable1 = "ThresholdsForRingOverrideTable1"
                        case thresholdsForRingOverrideTable0 = "ThresholdsForRingOverrideTable0"
                        case evaluateUpInterval = "EvaluateUpInterval"
                        case downStep = "DownStep"
                        case gt3Floor = "GT3Floor"
                        case startingPstateForRingTableOverride = "StartingPstateForRingTableOverride"
                        case ringOverrideTable2 = "RingOverrideTable2"
                        case numOfRingTableOverride = "NumOfRingTableOverride"
                        case ioBusynessSamplingInterval = "IOBusynessSamplingInterval"
                        case enableOverride = "EnableOverride"
                        case upStep = "UpStep"
                        case ringOverrideTable1 = "RingOverrideTable1"
                        case busyUpThresholdPercent = "BusyUpThresholdPercent"
                        case gt2Floor = "GT2Floor"
                        case id = "ID"
                        case busyDownThresholdPercent = "BusyDownThresholdPercent"
                        case ringOverrideTable0 = "RingOverrideTable0"
                        case numOfThresholdsForRingTables = "NumOfThresholdsForRingTables"
                        case numOfRingTables = "NumOfRingTables"
                        case sampleInterval
                        case evaluateDownInterval = "EvaluateDownInterval"
                        case enableRingTableOverride = "EnableRingTableOverride"
                    }
                }
                let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(iMac161: IMac161(igpu: BroadwellIgpu(boostPState: [24,24,24,24], heuristic: BroadwellHeuristic(thresholdsForRingOverrideTable2: [10,100], thresholdsForRingOverrideTable1: [5,15], thresholdsForRingOverrideTable0: [0,10], evaluateUpInterval: 31250, downStep: 1, gt3Floor: 15, startingPstateForRingTableOverride: 11, ringOverrideTable2: [8,8,8,9,10,11,13,14,15,16,18,19,20,21,23,24,25,26,28,30,31,33], numOfRingTableOverride: 23, ioBusynessSamplingInterval: 1, enableOverride: 1, upStep: 1, ringOverrideTable1: [8,8,8,9,10,11,13,14,15,16,16,16,16,16,16,16,16,16,16,16,16,16,16], busyUpThresholdPercent: 70, gt2Floor: 12, id: 2, busyDownThresholdPercent: 50, ringOverrideTable0: [8,8,8,8,8,9,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10], numOfThresholdsForRingTables: 2, numOfRingTables: 3, sampleInterval: 1000, evaluateDownInterval: 31250, enableRingTableOverride: 1), sliceControl: 1, gt3Capped: 1, maxPowerState: 11, controlID: 16, boostTime: [1,1,1,15]), GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
                
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath.path) {
                    existAlert()
                } else {
                    do {
                        try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                        let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                        let data = try plistEncoder.encode(plistToEncode)
                        try data.write(to: InfoPlistfilePath)
                        saveAlert()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        
        if popButton.titleOfSelectedItem == "iMac18,3" {
            if yesChecked.state == NSControlStateValueOff {
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
                    let controlID: Int
                    enum CodingKeys: String, CodingKey {
                        case agdcEnabled = "AGDCEnabled"
                        case Heuristic
                        
                        
                        case controlID = "control-id"
                    }
                }
                struct Heuristic: Codable {
                    let ID: Int
                }
                let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
                
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath.path) {
                    existAlert()
                } else {
                    do {
                        try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                        let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                        let data = try plistEncoder.encode(plistToEncode)
                        try data.write(to: InfoPlistfilePath)
                        saveAlert()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            } else {
                yesChecked.state = NSControlStateValueOn
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
                    let iMac183: IMac183
                    
                    enum CodingKeys: String, CodingKey {
                        case iMac183 = "iMac18,3"
                    }
                }
                struct IMac183: Codable {
                    let igpu: kabylakeIgpu
                    let GFX0: GFX0
                    
                    enum CodingKeys: String, CodingKey {
                        case igpu = "IGPU"
                        case GFX0
                    }
                }
                struct GFX0: Codable {
                    let agdcEnabled: Int
                    let Heuristic: Heuristic
                    let controlID: Int
                    enum CodingKeys: String, CodingKey {
                        case agdcEnabled = "AGDCEnabled"
                        case Heuristic
                        
                        
                        case controlID = "control-id"
                    }
                }
                struct Heuristic: Codable {
                    let ID: Int
                }
                struct kabylakeIgpu: Codable {
                    let boostPState: [Int]
                    let heuristic: kabylakeHeuristic
                    let sliceControl, controlID: Int
                    let boostTime: [Int]
                    
                    enum CodingKeys: String, CodingKey {
                        case boostPState = "BoostPState"
                        case heuristic = "Heuristic"
                        case sliceControl = "SliceControl"
                        case controlID = "control-id"
                        case boostTime = "BoostTime"
                    }
                }
                
                struct kabylakeHeuristic: Codable {
                    let thresholdsForRingOverrideTable2, thresholdsForRingOverrideTable1, thresholdsForRingOverrideTable0: [Int]
                    let evaluateUpInterval, downStep, gt3Floor, numOfRingTableOverride: Int
                    let cpgControl: CPGControl
                    let ringOverrideTable2: [Int]
                    let startingPstateForRingTableOverride, ioBusynessSamplingInterval, enableOverride: Int
                    let ringOverrideTable1: [Int]
                    let upStep, busyUpThresholdPercent, gt2Floor: Int
                    let rCxControl: RCxControl
                    let numOfThresholdsForRingTables, busyDownThresholdPercent, id: Int
                    let ringOverrideTable0: [Int]
                    let numOfRingTables, sampleInterval, evaluateDownInterval, enableRingTableOverride: Int
                    
                    enum CodingKeys: String, CodingKey {
                        case thresholdsForRingOverrideTable2 = "ThresholdsForRingOverrideTable2"
                        case thresholdsForRingOverrideTable1 = "ThresholdsForRingOverrideTable1"
                        case thresholdsForRingOverrideTable0 = "ThresholdsForRingOverrideTable0"
                        case evaluateUpInterval = "EvaluateUpInterval"
                        case downStep = "DownStep"
                        case gt3Floor = "GT3Floor"
                        case numOfRingTableOverride = "NumOfRingTableOverride"
                        case cpgControl = "CPGControl"
                        case ringOverrideTable2 = "RingOverrideTable2"
                        case startingPstateForRingTableOverride = "StartingPstateForRingTableOverride"
                        case ioBusynessSamplingInterval = "IOBusynessSamplingInterval"
                        case enableOverride = "EnableOverride"
                        case ringOverrideTable1 = "RingOverrideTable1"
                        case upStep = "UpStep"
                        case busyUpThresholdPercent = "BusyUpThresholdPercent"
                        case gt2Floor = "GT2Floor"
                        case rCxControl = "RCxControl"
                        case numOfThresholdsForRingTables = "NumOfThresholdsForRingTables"
                        case busyDownThresholdPercent = "BusyDownThresholdPercent"
                        case id = "ID"
                        case ringOverrideTable0 = "RingOverrideTable0"
                        case numOfRingTables = "NumOfRingTables"
                        case sampleInterval
                        case evaluateDownInterval = "EvaluateDownInterval"
                        case enableRingTableOverride = "EnableRingTableOverride"
                    }
                }
                
                struct CPGControl: Codable {
                    let mediaHysteresis, wakeLimit, renderHysteresis: Int
                    
                    enum CodingKeys: String, CodingKey {
                        case mediaHysteresis = "MediaHysteresis"
                        case wakeLimit = "Wake_Limit"
                        case renderHysteresis = "RenderHysteresis"
                    }
                }
                
                struct RCxControl: Codable {
                    let rc6WakeLimit, rc6Threshold, rpIdleHysteresis, rcEvalInterval: Int
                    
                    enum CodingKeys: String, CodingKey {
                        case rc6WakeLimit = "RC6_Wake_Limit"
                        case rc6Threshold = "RC6_Threshold"
                        case rpIdleHysteresis = "RP_Idle_Hysteresis"
                        case rcEvalInterval = "RC_Eval_Interval"
                    }
                }
                let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(iMac183: IMac183(igpu: kabylakeIgpu(boostPState: [24,24,24,24], heuristic: kabylakeHeuristic(thresholdsForRingOverrideTable2: [10,100], thresholdsForRingOverrideTable1: [5,15], thresholdsForRingOverrideTable0: [0,10], evaluateUpInterval: 31250, downStep: 1, gt3Floor: 17, numOfRingTableOverride: 23, cpgControl: CPGControl(mediaHysteresis: 32, wakeLimit: 80, renderHysteresis: 200), ringOverrideTable2: [9,11,12,14,15,17,18,20,21,23,24,26,27,29,30,32,33,35,36,38,39,41,42], startingPstateForRingTableOverride: 11, ioBusynessSamplingInterval: 1, enableOverride: 1, ringOverrideTable1: [9,11,12,14,15,17,18,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19,19], upStep: 1, busyUpThresholdPercent: 70, gt2Floor: 14, rCxControl: RCxControl(rc6WakeLimit: 40, rc6Threshold: 520, rpIdleHysteresis: 25, rcEvalInterval: 40000), numOfThresholdsForRingTables: 2, busyDownThresholdPercent: 50, id: 2, ringOverrideTable0: [8,8,8,8,8,9,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10], numOfRingTables: 3, sampleInterval: 1000, evaluateDownInterval: 31250, enableRingTableOverride: 1), sliceControl: 1, controlID: 16, boostTime: [1,1,1,15]), GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
                
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath.path) {
                    existAlert()
                } else {
                    do {
                        try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                        let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                        let data = try plistEncoder.encode(plistToEncode)
                        try data.write(to: InfoPlistfilePath)
                        saveAlert()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        
        if popButton.titleOfSelectedItem == "iMac15,2" {
            if yesChecked.state == NSControlStateValueOff {
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
                    let controlID: Int
                    enum CodingKeys: String, CodingKey {
                        case agdcEnabled = "AGDCEnabled"
                        case Heuristic
                        
                        
                        case controlID = "control-id"
                    }
                }
                struct Heuristic: Codable {
                    let ID: Int
                }
                let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
                
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath.path) {
                    existAlert()
                } else {
                    do {
                        try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                        let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                        let data = try plistEncoder.encode(plistToEncode)
                        try data.write(to: InfoPlistfilePath)
                        saveAlert()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            } else {
                yesChecked.state = NSControlStateValueOn
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
                    let iMac152: IMac152
                    enum CodingKeys: String, CodingKey {
                        case iMac152 = "iMac15,2"
                    }
                }
                struct IMac152: Codable {
                    let igpu: HaswellIgpu
                    let GFX0: GFX0
                    enum CodingKeys: String, CodingKey {
                        case igpu = "IGPU"
                        case GFX0
                    }
                }
                struct GFX0: Codable {
                    let agdcEnabled: Int
                    let Heuristic: Heuristic
                    let controlID: Int
                    enum CodingKeys: String, CodingKey {
                        case agdcEnabled = "AGDCEnabled"
                        case Heuristic
                        
                        
                        case controlID = "control-id"
                    }
                }
                struct Heuristic: Codable {
                    let ID: Int
                }
                struct HaswellIgpu: Codable {
                    let heuristic: HaswellIGPUHeuristic
                    let controlID: Int
                    
                    enum CodingKeys: String, CodingKey {
                        case heuristic = "Heuristic"
                        case controlID = "control-id"
                    }
                }
                struct HaswellIGPUHeuristic: Codable {
                    let enableRingTableOverride: Int
                    let thresholdsForRingOverrideTable0, ringOverrideTable1: [Int]
                    let numOfRingTables, id: Int
                    let thresholdsForRingOverrideTable1: [Int]
                    let enableOverride: Int
                    let ringOverrideTable0: [Int]
                    let startingPstateForRingTableOverride, ioBusynessSamplingInterval: Int
                    let thresholdsForRingOverrideTable2: [Int]
                    let numOfRingTableOverride, numOfThresholdsForRingTables: Int
                    let ringOverrideTable2: [Int]
                    
                    enum CodingKeys: String, CodingKey {
                        case enableRingTableOverride = "EnableRingTableOverride"
                        case thresholdsForRingOverrideTable0 = "ThresholdsForRingOverrideTable0"
                        case ringOverrideTable1 = "RingOverrideTable1"
                        case numOfRingTables = "NumOfRingTables"
                        case id = "ID"
                        case thresholdsForRingOverrideTable1 = "ThresholdsForRingOverrideTable1"
                        case enableOverride = "EnableOverride"
                        case ringOverrideTable0 = "RingOverrideTable0"
                        case startingPstateForRingTableOverride = "StartingPstateForRingTableOverride"
                        case ioBusynessSamplingInterval = "IOBusynessSamplingInterval"
                        case thresholdsForRingOverrideTable2 = "ThresholdsForRingOverrideTable2"
                        case numOfRingTableOverride = "NumOfRingTableOverride"
                        case numOfThresholdsForRingTables = "NumOfThresholdsForRingTables"
                        case ringOverrideTable2 = "RingOverrideTable2"
                    }
                }
                
                let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(iMac152: IMac152(igpu: HaswellIgpu(heuristic: HaswellIGPUHeuristic(enableRingTableOverride: 1, thresholdsForRingOverrideTable0: [0,10], ringOverrideTable1: [16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16,16], numOfRingTables: 3, id: 2, thresholdsForRingOverrideTable1: [5,15], enableOverride: 0, ringOverrideTable0: [8,8,8,8,8,9,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10], startingPstateForRingTableOverride: 11, ioBusynessSamplingInterval: 1, thresholdsForRingOverrideTable2: [10,100], numOfRingTableOverride: 23, numOfThresholdsForRingTables: 2, ringOverrideTable2: [8,8,8,9,10,11,13,14,15,16,18,1920,21,23,24,25,26,28,29,30,31,33]), controlID: 16), GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
                
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath.path) {
                    existAlert()
                } else {
                    do {
                        try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                        let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                        let data = try plistEncoder.encode(plistToEncode)
                        try data.write(to: InfoPlistfilePath)
                        saveAlert()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        
        if popButton.titleOfSelectedItem == "iMac13,2" {
            if yesChecked.state == NSControlStateValueOff {
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
                    let controlID: Int
                    enum CodingKeys: String, CodingKey {
                        case agdcEnabled = "AGDCEnabled"
                        case Heuristic
                        
                        
                        case controlID = "control-id"
                    }
                }
                struct Heuristic: Codable {
                    let ID: Int
                }
                let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
                
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath.path) {
                    existAlert()
                } else {
                    do {
                        try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                        let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                        let data = try plistEncoder.encode(plistToEncode)
                        try data.write(to: InfoPlistfilePath)
                        saveAlert()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            } else {
                yesChecked.state = NSControlStateValueOn
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
                    let iMac132: IMac132
                    
                    enum CodingKeys: String, CodingKey {
                        case iMac132 = "iMac13,2"
                    }
                }
                struct IMac132: Codable {
                    let igpu: IvyBridgeIgpu
                    let GFX0: GFX0
                    
                    enum CodingKeys: String, CodingKey {
                        case igpu = "IGPU"
                        case GFX0
                    }
                }
                struct GFX0: Codable {
                    let agdcEnabled: Int
                    let Heuristic: Heuristic
                    let controlID: Int
                    enum CodingKeys: String, CodingKey {
                        case agdcEnabled = "AGDCEnabled"
                        case Heuristic
                        
                        
                        case controlID = "control-id"
                    }
                }
                struct Heuristic: Codable {
                    let ID: Int
                }
                struct IvyBridgeIgpu: Codable {
                    let heuristic: IvyBridgeIGPUHeuristic
                    let controlID: Int
                    
                    enum CodingKeys: String, CodingKey {
                        case heuristic = "Heuristic"
                        case controlID = "control-id"
                    }
                }
                
                struct IvyBridgeIGPUHeuristic: Codable {
                    let enableOverride, id: Int
                    
                    enum CodingKeys: String, CodingKey {
                        case enableOverride = "EnableOverride"
                        case id = "ID"
                    }
                }
                let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(iMac132: IMac132(igpu: IvyBridgeIgpu(heuristic: IvyBridgeIGPUHeuristic(enableOverride: 0, id: 2), controlID: 16), GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
                
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath.path) {
                    existAlert()
                } else {
                    do {
                        try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                        let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                        let data = try plistEncoder.encode(plistToEncode)
                        try data.write(to: InfoPlistfilePath)
                        saveAlert()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        
        if popButton.titleOfSelectedItem == "iMac16,2" {
            if yesChecked.state == NSControlStateValueOff {
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
                    let controlID: Int
                    enum CodingKeys: String, CodingKey {
                        case agdcEnabled = "AGDCEnabled"
                        case Heuristic
                        
                        
                        case controlID = "control-id"
                    }
                }
                struct Heuristic: Codable {
                    let ID: Int
                }
                let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
                
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath.path) {
                    existAlert()
                } else {
                    do {
                        try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                        let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                        let data = try plistEncoder.encode(plistToEncode)
                        try data.write(to: InfoPlistfilePath)
                        saveAlert()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            } else {
                yesChecked.state = NSControlStateValueOn
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
                    let iMac162: IMac162
                    
                    enum CodingKeys: String, CodingKey {
                        case iMac162 = "iMac16,2"
                    }
                }
                struct IMac162: Codable {
                    let igpu: BroadwellIgpu
                    let GFX0: GFX0
                    
                    enum CodingKeys: String, CodingKey {
                        case igpu = "IGPU"
                        case GFX0
                    }
                }
                struct GFX0: Codable {
                    let agdcEnabled: Int
                    let Heuristic: Heuristic
                    let controlID: Int
                    enum CodingKeys: String, CodingKey {
                        case agdcEnabled = "AGDCEnabled"
                        case Heuristic
                        
                        
                        case controlID = "control-id"
                    }
                }
                struct Heuristic: Codable {
                    let ID: Int
                }
                struct BroadwellIgpu: Codable {
                    let boostPState: [Int]
                    let heuristic: BroadwellHeuristic
                    let sliceControl, gt3Capped, maxPowerState, controlID: Int
                    let boostTime: [Int]
                    
                    enum CodingKeys: String, CodingKey {
                        case boostPState = "BoostPState"
                        case heuristic = "Heuristic"
                        case sliceControl = "SliceControl"
                        case gt3Capped = "GT3Capped"
                        case maxPowerState = "max-power-state"
                        case controlID = "control-id"
                        case boostTime = "BoostTime"
                    }
                }
                struct BroadwellHeuristic: Codable {
                    let thresholdsForRingOverrideTable2, thresholdsForRingOverrideTable1, thresholdsForRingOverrideTable0: [Int]
                    let evaluateUpInterval, downStep, gt3Floor, startingPstateForRingTableOverride: Int
                    let ringOverrideTable2: [Int]
                    let numOfRingTableOverride, ioBusynessSamplingInterval, enableOverride, upStep: Int
                    let ringOverrideTable1: [Int]
                    let busyUpThresholdPercent, gt2Floor, id, busyDownThresholdPercent: Int
                    let ringOverrideTable0: [Int]
                    let numOfThresholdsForRingTables, numOfRingTables, sampleInterval, evaluateDownInterval: Int
                    let enableRingTableOverride: Int
                    enum CodingKeys: String, CodingKey {
                        case thresholdsForRingOverrideTable2 = "ThresholdsForRingOverrideTable2"
                        case thresholdsForRingOverrideTable1 = "ThresholdsForRingOverrideTable1"
                        case thresholdsForRingOverrideTable0 = "ThresholdsForRingOverrideTable0"
                        case evaluateUpInterval = "EvaluateUpInterval"
                        case downStep = "DownStep"
                        case gt3Floor = "GT3Floor"
                        case startingPstateForRingTableOverride = "StartingPstateForRingTableOverride"
                        case ringOverrideTable2 = "RingOverrideTable2"
                        case numOfRingTableOverride = "NumOfRingTableOverride"
                        case ioBusynessSamplingInterval = "IOBusynessSamplingInterval"
                        case enableOverride = "EnableOverride"
                        case upStep = "UpStep"
                        case ringOverrideTable1 = "RingOverrideTable1"
                        case busyUpThresholdPercent = "BusyUpThresholdPercent"
                        case gt2Floor = "GT2Floor"
                        case id = "ID"
                        case busyDownThresholdPercent = "BusyDownThresholdPercent"
                        case ringOverrideTable0 = "RingOverrideTable0"
                        case numOfThresholdsForRingTables = "NumOfThresholdsForRingTables"
                        case numOfRingTables = "NumOfRingTables"
                        case sampleInterval
                        case evaluateDownInterval = "EvaluateDownInterval"
                        case enableRingTableOverride = "EnableRingTableOverride"
                    }
                }
                let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(iMac162: IMac162(igpu: BroadwellIgpu(boostPState: [24,24,24,24], heuristic: BroadwellHeuristic(thresholdsForRingOverrideTable2: [10,100], thresholdsForRingOverrideTable1: [5,15], thresholdsForRingOverrideTable0: [0,10], evaluateUpInterval: 31250, downStep: 1, gt3Floor: 15, startingPstateForRingTableOverride: 11, ringOverrideTable2: [8,8,8,9,10,11,13,14,15,16,18,19,20,21,23,24,25,26,28,30,31,33], numOfRingTableOverride: 23, ioBusynessSamplingInterval: 1, enableOverride: 1, upStep: 1, ringOverrideTable1: [8,8,8,9,10,11,13,14,15,16,16,16,16,16,16,16,16,16,16,16,16,16,16], busyUpThresholdPercent: 70, gt2Floor: 12, id: 2, busyDownThresholdPercent: 50, ringOverrideTable0: [8,8,8,8,8,9,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10], numOfThresholdsForRingTables: 2, numOfRingTables: 3, sampleInterval: 1000, evaluateDownInterval: 31250, enableRingTableOverride: 1), sliceControl: 1, gt3Capped: 1, maxPowerState: 11, controlID: 16, boostTime: [1,1,1,15]), GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
                
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath.path) {
                    existAlert()
                } else {
                    do {
                        try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                        let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                        let data = try plistEncoder.encode(plistToEncode)
                        try data.write(to: InfoPlistfilePath)
                        saveAlert()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
        
        if popButton.titleOfSelectedItem == "iMac12,2" {
            yesChecked.state = NSControlStateValueOff
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
                let controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    
                    
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: filePath.path) {
                existAlert()
            } else {
                do {
                    try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                    let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                    let data = try plistEncoder.encode(plistToEncode)
                    try data.write(to: InfoPlistfilePath)
                    saveAlert()
                }
                catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        if popButton.titleOfSelectedItem == "iMac12,1" {
            yesChecked.state = NSControlStateValueOff
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
                let controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    
                    
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: filePath.path) {
                existAlert()
            } else {
                do {
                    try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                    let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                    let data = try plistEncoder.encode(plistToEncode)
                    try data.write(to: InfoPlistfilePath)
                    saveAlert()
                }
                catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        if popButton.titleOfSelectedItem == "iMac11,3" {
            yesChecked.state = NSControlStateValueOff
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
                let controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: filePath.path) {
                existAlert()
            } else {
                do {
                    try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                    let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                    let data = try plistEncoder.encode(plistToEncode)
                    try data.write(to: InfoPlistfilePath)
                    saveAlert()
                }
                catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        if popButton.titleOfSelectedItem == "iMac11,2" {
            yesChecked.state = NSControlStateValueOff
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
                let controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: filePath.path) {
                existAlert()
            } else {
                do {
                    try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                    let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                    let data = try plistEncoder.encode(plistToEncode)
                    try data.write(to: InfoPlistfilePath)
                    saveAlert()
                }
                catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        if popButton.titleOfSelectedItem == "iMac11,1" {
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
                let controlID: Int
                enum CodingKeys: String, CodingKey {
                    case agdcEnabled = "AGDCEnabled"
                    case Heuristic
                    case controlID = "control-id"
                }
            }
            struct Heuristic: Codable {
                let ID: Int
            }
            let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(macPro51: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
            
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: filePath.path) {
                existAlert()
            } else {
                do {
                    try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                    let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                    let data = try plistEncoder.encode(plistToEncode)
                    try data.write(to: InfoPlistfilePath)
                    saveAlert()
                }
                catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        if popButton.titleOfSelectedItem == "iMac10,1" {
            if yesChecked.state == NSControlStateValueOn {
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
                    let iMac101: Wolfdale
                    
                    enum CodingKeys: String, CodingKey {
                        case iMac101 = "iMac10,1"
                    }
                }
                struct Wolfdale: Codable {
                    let igpu: WolfdaleIgpu
                    let gfx0: GFX0
                    let defaultControlID: Int
                    
                    enum CodingKeys: String, CodingKey {
                        case igpu = "IGPU"
                        case gfx0 = "GFX0"
                        case defaultControlID = "default-control-id"
                    }
                }
                
                struct GFX0: Codable {
                    let agdcEnabled: Int
                    let Heuristic: Heuristic
                    let controlID: Int
                    enum CodingKeys: String, CodingKey {
                        case agdcEnabled = "AGDCEnabled"
                        case Heuristic
                        case controlID = "control-id"
                    }
                }
                
                struct Heuristic: Codable {
                    let ID: Int
                }
                
                struct WolfdaleHeuristic: Codable {
                    let thresholdLow: [Int]
                    let idleInterval: Int
                    let sensorOption: Int?
                    let thresholdHigh: [Int]
                    let id: Int
                    let targetCount: Int?
                    
                    enum CodingKeys: String, CodingKey {
                        case thresholdLow = "Threshold_Low"
                        case idleInterval = "IdleInterval"
                        case sensorOption = "SensorOption"
                        case thresholdHigh = "Threshold_High"
                        case id = "ID"
                        case targetCount = "TargetCount"
                    }
                }
                
                struct WolfdaleIgpu: Codable {
                    let boostPState: [Int]
                    let heuristic: WolfdaleHeuristic
                    let controlID: Int
                    let boostTime: [Int]
                    
                    enum CodingKeys: String, CodingKey {
                        case boostPState = "BoostPState"
                        case heuristic = "Heuristic"
                        case controlID = "control-id"
                        case boostTime = "BoostTime"
                    }
                }
                
                let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(iMac101: Wolfdale(igpu: WolfdaleIgpu(boostPState: [0,1,2,3], heuristic: WolfdaleHeuristic(thresholdLow: [0,90,90,90], idleInterval: 100, sensorOption: 1, thresholdHigh: [80,80,80,100], id: 0, targetCount: 5), controlID: 16, boostTime: [3,3,3,3]), gfx0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18), defaultControlID: 18)))), osBundleRequired: plistData.osBundleRequired)
                
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath.path) {
                    existAlert()
                } else {
                    do {
                        try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                        let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                        let data = try plistEncoder.encode(plistToEncode)
                        try data.write(to: InfoPlistfilePath)
                        saveAlert()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            }
            else {
                yesChecked.state = NSControlStateValueOff
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
                    let iMac101: MacPro
                    
                    enum CodingKeys: String, CodingKey {
                        case iMac101 = "iMac10,1"
                    }
                }
                struct MacPro: Codable {
                    let GFX0: GFX0
                }
                
                struct GFX0: Codable {
                    let agdcEnabled: Int
                    let Heuristic: Heuristic
                    let controlID: Int
                    enum CodingKeys: String, CodingKey {
                        case agdcEnabled = "AGDCEnabled"
                        case Heuristic
                        case controlID = "control-id"
                    }
                }
                
                struct Heuristic: Codable {
                    let ID: Int
                }
                
                struct WolfdaleHeuristic: Codable {
                    let thresholdLow: [Int]
                    let idleInterval: Int
                    let sensorOption: Int?
                    let thresholdHigh: [Int]
                    let id: Int
                    let targetCount: Int?
                    
                    enum CodingKeys: String, CodingKey {
                        case thresholdLow = "Threshold_Low"
                        case idleInterval = "IdleInterval"
                        case sensorOption = "SensorOption"
                        case thresholdHigh = "Threshold_High"
                        case id = "ID"
                        case targetCount = "TargetCount"
                    }
                }
                let plistToEncode = PlistSet(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, IOKitPersonalities: IOKitPersonalities(AGPM: AGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, Machines: Machines(iMac101: MacPro(GFX0: GFX0(agdcEnabled: 1, Heuristic: Heuristic(ID: 0), controlID: 18))))), osBundleRequired: plistData.osBundleRequired)
                
                let fileManager = FileManager.default
                if fileManager.fileExists(atPath: filePath.path) {
                    existAlert()
                } else {
                    do {
                        try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                        let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                        let data = try plistEncoder.encode(plistToEncode)
                        try data.write(to: InfoPlistfilePath)
                        saveAlert()
                    }
                    catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}

