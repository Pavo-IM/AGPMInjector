//
//  ViewController.swift
//  AGPMInjector
//
//  Created by Pavo on 12/28/18.
//  Copyright © 2018 Pavo. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    let setDocumentDirectory = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!
    let getAGPMFilePath = "/System/Library/Extensions/AppleGraphicsPowerManagement.kext/Contents/Info.plist"
    let bundleID = "com.apple.driver.AGPMInjector"
    let bundleName = "AGPMInjector"
    let bundleShortVersionName = "2.7.3-AGPMInjector"
    let bundleSig = "????"
    let bundleReq = "Local-Root"
    // Create Decoder object
    let plistDecoder = PropertyListDecoder()
    // Write the AGPMInjector.kext/Contents directory to the users Desktop and copying AGPMInjector.plist into that directory as Info.plist
    let setAGPMInjectorDirectory = "AGPMInjector.kext/Contents"
    let setInfoPlistName = "Info.plist"
    
    @IBOutlet weak var machineSelected: NSPopUpButton!
    @IBOutlet weak var AMDMenu: NSPopUpButton!
    @IBOutlet weak var NvidiaMenu: NSPopUpButton!
    @IBOutlet weak var AMDCheck: NSButton!
    @IBOutlet weak var NvidiaCheck: NSButton!
    
    
    
    override func viewDidLoad() {
        AMDMenu.isHidden = true
        NvidiaMenu.isHidden = true
        self.preferredContentSize = NSMakeSize(self.view.frame.size.width, self.view.frame.size.height)
        super.viewDidLoad()
        let getAGPMFilePathURL = URL.init(fileURLWithPath: getAGPMFilePath)
        // Decoder the AppleGraphicsPowerManagement.kext Info.plist and get some information to save as variable
        let data = try! Data(contentsOf: getAGPMFilePathURL)
        let plistData = try! plistDecoder.decode(PlistGet.self, from: data)
        var machineArray = [String](plistData.IOKitPersonalities.AGPM.Machines.keys)
        var AMDArray = [String]()
        var NvidiaArray = [String]()
        
        func removeItemsFromArray(item: String) {
            if let item = machineArray.firstIndex(of: "\(item)") {
                machineArray.remove(at: item)
            }
        }
        
        func renameItemInArray(olditem: String, newitem: String) {
            if let olditem = machineArray.firstIndex(of: "\(olditem)") {
                machineArray.remove(at: olditem)
                machineArray.insert("\(newitem)", at: olditem)
            }
        }
        
        func addItemsToAmdArray(item: String) {
            AMDArray.append(item)
        }
        
        func addItemsToNvidiaArray(item: String) {
            NvidiaArray.append(item)
        }
        
        // Add AMD GPUs
        addItemsToAmdArray(item: "RadeonVII")
        addItemsToAmdArray(item: "R9270")
        addItemsToAmdArray(item: "R9270X")
        addItemsToAmdArray(item: "R9280")
        addItemsToAmdArray(item: "R9280X")
        addItemsToAmdArray(item: "R9290")
        addItemsToAmdArray(item: "R9290X")
        addItemsToAmdArray(item: "R9295X2")
        addItemsToAmdArray(item: "R9380")
        addItemsToAmdArray(item: "R9380X")
        addItemsToAmdArray(item: "R9390")
        addItemsToAmdArray(item: "R9390X")
        addItemsToAmdArray(item: "R9Fury")
        addItemsToAmdArray(item: "RX460")
        addItemsToAmdArray(item: "RX470")
        addItemsToAmdArray(item: "RX480")
        addItemsToAmdArray(item: "RX550")
        addItemsToAmdArray(item: "RX560")
        addItemsToAmdArray(item: "RX570")
        addItemsToAmdArray(item: "RX580")
        addItemsToAmdArray(item: "RX590")
        addItemsToAmdArray(item: "Vega56")
        addItemsToAmdArray(item: "Vega64")
        addItemsToAmdArray(item: "VegaFrontier")
        addItemsToAmdArray(item: "ProDuo")
        addItemsToAmdArray(item: "W7100")
        addItemsToAmdArray(item: "W9100")
        addItemsToAmdArray(item: "RX5700XT")
        
        // Add Nvidia GPUs
        addItemsToNvidiaArray(item: "GTX650")
        addItemsToNvidiaArray(item: "GTX650Ti")
        addItemsToNvidiaArray(item: "GTX650TIBoost")
        addItemsToNvidiaArray(item: "GTX760")
        addItemsToNvidiaArray(item: "GTX760Ti")
        addItemsToNvidiaArray(item: "GTX770")
        addItemsToNvidiaArray(item: "GTX780")
        addItemsToNvidiaArray(item: "GTX780Ti")
        addItemsToNvidiaArray(item: "GTX950")
        addItemsToNvidiaArray(item: "GTX960")
        addItemsToNvidiaArray(item: "GTX970")
        addItemsToNvidiaArray(item: "GTX980")
        addItemsToNvidiaArray(item: "GTX980Ti")
        addItemsToNvidiaArray(item: "GTX1050")
        addItemsToNvidiaArray(item: "GTX1050Ti")
        addItemsToNvidiaArray(item: "GTX1060")
        addItemsToNvidiaArray(item: "GTX1070")
        addItemsToNvidiaArray(item: "GTX1070Ti")
        addItemsToNvidiaArray(item: "GTX1080")
        addItemsToNvidiaArray(item: "GTX1080Ti")
        addItemsToNvidiaArray(item: "GTX2070")
        addItemsToNvidiaArray(item: "GTXTitan")
        addItemsToNvidiaArray(item: "RTX2060")
        addItemsToNvidiaArray(item: "RTX2060Super")
        addItemsToNvidiaArray(item: "RTX2070")
        addItemsToNvidiaArray(item: "RTX2070Super")
        addItemsToNvidiaArray(item: "RTX2080")
        addItemsToNvidiaArray(item: "RTX2080Super")
        addItemsToNvidiaArray(item: "RTX2080Ti")
        addItemsToNvidiaArray(item: "RTXTitan")
        addItemsToNvidiaArray(item: "TitanV")
        addItemsToNvidiaArray(item: "TitanX")
        addItemsToNvidiaArray(item: "TitanXP")
        
        // Remove machines that do not make sense to have "desktop" type of GPU and rename board-id types to model types
        removeItemsFromArray(item: "MacBookAir2,1")
        removeItemsFromArray(item: "MacBookAir4,1")
        removeItemsFromArray(item: "MacBookAir4,2")
        removeItemsFromArray(item: "Mac-226CB3C6A851A671")
        removeItemsFromArray(item: "Mac-53FDB3D8DB8CA971")
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
        removeItemsFromArray(item: "Vendor8086Device8a51")
        removeItemsFromArray(item: "Vendor8086Device8a52")
        removeItemsFromArray(item: "Vendor8086Device8a5a")
        removeItemsFromArray(item: "Vendor8086Device8a5b")
        removeItemsFromArray(item: "Vendor8086Device8a5c")
        removeItemsFromArray(item: "Vendor8086Device8a5d")
        removeItemsFromArray(item: "Vendor8086Device8a70")
        removeItemsFromArray(item: "Vendor8086Device8a71")
        renameItemInArray(olditem: "Mac-27AD2F918AE68F61", newitem: "MacPro7,1")
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
        renameItemInArray(olditem: "Mac-63001698E7A34814", newitem: "iMac19,2")
        renameItemInArray(olditem: "Mac-AA95B1DDAB278B95", newitem: "iMac19,1")
        
        let sortedArray = machineArray.sorted()
        let sortedAMDArray = AMDArray.sorted()
        let sortedNvidiaArray = NvidiaArray.sorted()
        
        AMDMenu.removeAllItems()
        AMDMenu.addItems(withTitles: sortedAMDArray)
        AMDMenu.selectItem(at: 0)
        NvidiaMenu.removeAllItems()
        NvidiaMenu.addItems(withTitles: sortedNvidiaArray)
        NvidiaMenu.selectItem(at: 0)
        machineSelected.removeAllItems()
        machineSelected.addItems(withTitles: sortedArray)
        machineSelected.selectItem(at: 0)
    }
    
    func saveAlert () {
        let fileManager = FileManager.default
        let home = fileManager.homeDirectoryForCurrentUser
        let kextPath = "Downloads/AGPMInjector.kext"
        let kextUrl = home.appendingPathComponent(kextPath)
        let alert = NSAlert()
        alert.messageText = "Injector Kext Generation Complete!"
        alert.informativeText = "AGPMInjector.kext has been generated and saved to \(kextUrl.path)"
        alert.beginSheetModal(for: self.view.window!, completionHandler: nil)
    }
    
    func existAlert () {
        let fileManager = FileManager.default
        let home = fileManager.homeDirectoryForCurrentUser
        let kextPath = "Downloads/AGPMInjector.kext"
        let kextUrl = home.appendingPathComponent(kextPath)
        let alert = NSAlert()
        alert.alertStyle = .critical
        alert.addButton(withTitle: "Delete")
        alert.messageText = "File Already Exist!"
        alert.informativeText = "AGPMInjector.kext already exist at \(kextUrl.path). Click the Delete button to delete the existing file!"
        alert.beginSheetModal(for: self.view.window!, completionHandler: { (returnCode) -> Void in
            switch returnCode {
            case NSApplication.ModalResponse.alertFirstButtonReturn: do {
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
    
    func savePlist<EncodableType: Encodable>(encodable: EncodableType) {
        let plistEncoder = PropertyListEncoder()
        plistEncoder.outputFormat = .xml
        let filePath =  setDocumentDirectory.appendingPathComponent("\(setAGPMInjectorDirectory)")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: filePath.path) {
            existAlert()
        } else {
            do {
                try FileManager.default.createDirectory(atPath: filePath.path, withIntermediateDirectories: true, attributes: nil)
                let InfoPlistfilePath =  filePath.appendingPathComponent("\(setInfoPlistName)")
                let data = try plistEncoder.encode(encodable)
                try data.write(to: InfoPlistfilePath)
                saveAlert()
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
    
    @IBAction func AMDChecked(_ sender: NSButton) {
        AMDMenu.isHidden = (sender.state == .off)
    }
    @IBAction func NvidiaChecked(_ sender: NSButton) {
        NvidiaMenu.isHidden = (sender.state == .off)
    }
    @IBAction func generateButton(_ sender: Any) {
//        let filePath =  setDocumentDirectory.appendingPathComponent("\(setAGPMInjectorDirectory)")
//        if FileManager.default.fileExists(atPath: filePath.path) {
//            existAlert()
//        }
        let getAGPMFilePathURL = URL.init(fileURLWithPath: getAGPMFilePath)
        // Decoder the AppleGraphicsPowerManagement.kext Info.plist and get some information to save as variable
        let data = try! Data(contentsOf: getAGPMFilePathURL)
        let plistData = try! plistDecoder.decode(PlistGet.self, from: data)
        let plistEncoder = PropertyListEncoder()
        plistEncoder.outputFormat = .xml
        // Create objects to represent the plist data to get encoded
        let AgdcEnabled = 1
        let controlID = 17
        let maxPState = 15
        let miniPState = 0
        let setID = -1
        if AMDCheck.state == NSControl.StateValue.on {
            NvidiaMenu.state = NSControl.StateValue.off
            if AMDMenu.titleOfSelectedItem == "RX5700XT" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .RX5700XT, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if AMDMenu.titleOfSelectedItem == "RadeonVII" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .RadeonVII, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            
            if AMDMenu.titleOfSelectedItem == "R9270" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .R9270, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            
            if AMDMenu.titleOfSelectedItem == "R9270X" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .R9270X, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if AMDMenu.titleOfSelectedItem == "R9280" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .R9280, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if AMDMenu.titleOfSelectedItem == "R9280X" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .R9280X, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if AMDMenu.titleOfSelectedItem == "R9290" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .R9290390, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if AMDMenu.titleOfSelectedItem == "R9290X" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .R9290X390X, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if AMDMenu.titleOfSelectedItem == "R9295X2" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .R9295X2, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if AMDMenu.titleOfSelectedItem == "R9380" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .R9380, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if AMDMenu.titleOfSelectedItem == "R9380X" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .R9380X, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if AMDMenu.titleOfSelectedItem == "R9390" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .R9290390, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if AMDMenu.titleOfSelectedItem == "R9390X" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .R9290X390X, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if AMDMenu.titleOfSelectedItem == "R9Fury" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .R9Fury, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if AMDMenu.titleOfSelectedItem == "RX460" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .RX460, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if AMDMenu.titleOfSelectedItem == "RX470" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .RX470480570580590, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if AMDMenu.titleOfSelectedItem == "RX480" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .RX470480570580590, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if AMDMenu.titleOfSelectedItem == "RX550" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .RX550, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if AMDMenu.titleOfSelectedItem == "RX560" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .RX560, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if AMDMenu.titleOfSelectedItem == "RX570" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .RX470480570580590, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if AMDMenu.titleOfSelectedItem == "RX580" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .RX470480570580590, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if AMDMenu.titleOfSelectedItem == "RX590" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .RX470480570580590, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if AMDMenu.titleOfSelectedItem == "Vega56" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .Vega5664, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if AMDMenu.titleOfSelectedItem == "Vega64" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .Vega5664, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if AMDMenu.titleOfSelectedItem == "VegaFrontier" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .VegaFrontier, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if AMDMenu.titleOfSelectedItem == "ProDuo" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .ProDuo, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if AMDMenu.titleOfSelectedItem == "W7100" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .W7100, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if AMDMenu.titleOfSelectedItem == "W9100" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .W9100, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
        }
        
        if NvidiaCheck.state == NSControl.StateValue.on {
            AMDMenu.state = NSControl.StateValue.off
            if NvidiaMenu.titleOfSelectedItem == "GTX650" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .GTX650, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
            
                savePlist(encodable: plistToEncode)
            }
            if NvidiaMenu.titleOfSelectedItem == "GTX650Ti" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .GTX650Ti, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if NvidiaMenu.titleOfSelectedItem == "GTX650TIBoost" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .GTX650TIBoost, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if NvidiaMenu.titleOfSelectedItem == "GTX760" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .GTX760, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if NvidiaMenu.titleOfSelectedItem == "GTX760Ti" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .GTX760Ti, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if NvidiaMenu.titleOfSelectedItem == "GTX770" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .GTX770, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if NvidiaMenu.titleOfSelectedItem == "GTX780" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .GTX780, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if NvidiaMenu.titleOfSelectedItem == "GTX780Ti" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .GTX780Ti, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if NvidiaMenu.titleOfSelectedItem == "GTX950" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .GTX950, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if NvidiaMenu.titleOfSelectedItem == "GTX960" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .GTX960, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if NvidiaMenu.titleOfSelectedItem == "GTX970" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .GTX970, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if NvidiaMenu.titleOfSelectedItem == "GTX980" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .GTX980, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if NvidiaMenu.titleOfSelectedItem == "GTX980Ti" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .GTX980Ti, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if NvidiaMenu.titleOfSelectedItem == "GTX1050" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .GTX1050, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if NvidiaMenu.titleOfSelectedItem == "GTX1050Ti" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .GTX1050Ti, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if NvidiaMenu.titleOfSelectedItem == "GTX1060" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .GTX1060, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if NvidiaMenu.titleOfSelectedItem == "GTX1070" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .GTX1070, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if NvidiaMenu.titleOfSelectedItem == "GTX1070Ti" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .GTX1070Ti, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if NvidiaMenu.titleOfSelectedItem == "GTX1080" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .GTX1080, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if NvidiaMenu.titleOfSelectedItem == "GTX1080Ti" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .GTX1080Ti, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if NvidiaMenu.titleOfSelectedItem == "GTX2070" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .GTX2070, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if NvidiaMenu.titleOfSelectedItem == "GTXTitan" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .GTXTitan, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if NvidiaMenu.titleOfSelectedItem == "RTX2060" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .RTX2060, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if NvidiaMenu.titleOfSelectedItem == "RTX2060Super" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .RTX2060Super, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if NvidiaMenu.titleOfSelectedItem == "RTX2070" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .RTX2070, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if NvidiaMenu.titleOfSelectedItem == "RTX2070Super" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .RTX2070Super, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if NvidiaMenu.titleOfSelectedItem == "RTX2080" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .RTX2080, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if NvidiaMenu.titleOfSelectedItem == "RTX2080Super" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .RTX2080Super, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if NvidiaMenu.titleOfSelectedItem == "RTX2080Ti" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .RTX2080Ti, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if NvidiaMenu.titleOfSelectedItem == "RTXTitan" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .RTXTitan, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if NvidiaMenu.titleOfSelectedItem == "TitanV" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .TitanV, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if NvidiaMenu.titleOfSelectedItem == "TitanX" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .TitanX, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
            if NvidiaMenu.titleOfSelectedItem == "TitanXP" {
                let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: plistData.cfBundleIdentifier, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: plistData.cfBundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: plistData.cfBundleShortVersionString, cfBundleSignature: plistData.cfBundleSignature, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(rawValue: machineSelected.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: .TitanXP, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
                
                savePlist(encodable: plistToEncode)
            }
        }
    }
}
