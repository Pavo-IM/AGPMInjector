import Cocoa

class ViewController: NSViewController {
    let setDocumentDirectory = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask).first!
    let getAGPMFilePath = "/System/Library/Extensions/AppleGraphicsPowerManagement.kext/Contents/Info.plist"
    let bundleID = "com.apple.driver.AGPMInjector"
    let bundleName = "AGPMInjector"
    let bundleShortVersionName = "3.2.1-AGPMInjector"
    let bundleSig = "????"
    // Create Decoder object
    let plistDecoder = PropertyListDecoder()
    // Write the AGPMInjector.kext/Contents directory to the users Desktop and copying AGPMInjector.plist into that directory as Info.plist
    let setAGPMInjectorDirectory = "AGPMInjector.kext/Contents"
    let setInfoPlistName = "Info.plist"
    let AgdcEnabled = 1
    let controlID = 17
    let maxPState = 15
    let miniPState = 0
    let setID = -1
    var AMDDictionary = [
        "RX 5600XT": "Vendor1002Device731F",
        "RX 5500XT": "Vendor1002Device7340",
        "Radeon VII": "Vendor1002Device66af",
        "R9 270": "Vendor1002Device6811",
        "R9 270X": "Vendor1002Device6810",
        "R9 280": "Vendor1002Device679a",
        "R9 280X": "Vendor1002Device6798",
        "R9 295 X2": "Vendor1002Device67b9",
        "R9 380": "Vendor1002Device6939",
        "R9 380X": "Vendor1002Device6938",
        "R9 290": "Vendor1002Device67b1",
        "R9 390": "Vendor1002Device67b1",
        "R9 290X": "Vendor1002Device67b0",
        "RP 390X": "Vendor1002Device67b0",
        "R9 Fury": "Vendor1002Device7300",
        "RX 460": "Vendor1002Device67ef",
        "RX 550": "Vendor1002Device699f",
        "RX 560": "Vendor1002Device67ff",
        "RX 470": "Vendor1002Device67df",
        "RX 480": "Vendor1002Device67df",
        "RX 570": "Vendor1002Device67df",
        "RX 580": "Vendor1002Device67df",
        "RX 590": "Vendor1002Device67df",
        "Vega 56": "Vendor1002Device687f",
        "Vega 64": "Vendor1002Device687f",
        "Vega Frontier": "Vendor1002Device6863",
        "Pro Duo": "Vendor1002Device67c4",
        "W 7100": "Vendor1002Device692b",
        "W 9100": "Vendor1002Device67a0",
        "RX 5700XT": "Vendor1002Device731f"
    ]
    
    var NvidiaDictionary = [
        "GT 710": "Vendor10deDevice128b",
        "GT 730": "Vendor10deDevice1287",
        "GTX 650": "Vendor10deDevice8428",
        "GTX 650 Ti": "Vendor10deDevice11c6",
        "GTX 650 TI Boost": "Vendor10deDevice11c2",
        "GTX 760": "Vendor10deDevice1187",
        "GTX 760 Ti": "Vendor10deDevice1189",
        "GTX 770": "Vendor10deDevice1184",
        "GTX 780": "Vendor10deDevice1004",
        "GTX 780 Ti": "Vendor10deDevice100a",
        "GTX 950": "Vendor10deDevice1402",
        "GTX 960": "Vendor10deDevice1401",
        "GTX 970": "Vendor10deDevice13c2",
        "GTX 980": "Vendor10deDevice13c0",
        "GTX 980 Ti": "Vendor10deDevice17c8",
        "GTX 1050": "Vendor10deDevice1c81",
        "GTX 1050 Ti": "Vendor10deDevice1c82",
        "GTX 1060": "Vendor10deDevice1c02",
        "GTX 1070": "Vendor10deDevice1b81",
        "GTX 1070 Ti": "Vendor10deDevice1b82",
        "GTX 1080": "Vendor10deDevice1b80",
        "GTX 1080 Ti": "Vendor10deDevice1b06",
        "GTX Titan": "Vendor10deDevice1005",
        "Titan V": "Vendor10deDevice1d81",
        "Titan X": "Vendor10deDevice1b00",
        "Titan XP": "Vendor10deDevice1b02",
        "GTX Titan Black": "Vendor10deDevice100c"
    ]
    
    @IBOutlet weak var machineSelected: NSPopUpButton!
    @IBOutlet weak var AMDMenu: NSPopUpButton!
    @IBOutlet weak var NvidiaMenu: NSPopUpButton!
    @IBOutlet weak var AMDCheck: NSButton!
    @IBOutlet weak var NvidiaCheck: NSButton!
    @IBOutlet weak var amdimage: NSImageView!
    @IBOutlet weak var smbiosImage: NSImageView!
    @IBOutlet weak var nvidiaImage: NSImageView!
    
    
    
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
        removeItemsFromArray(item: "Mac-E1008331FDC96864")
        removeItemsFromArray(item: "Mac-564FBA6031E5946A")
        removeItemsFromArray(item: "Mac-0CFF9C7C2B63DF8D")
        removeItemsFromArray(item: "Mac-87DCB00F4AD77EEA")
        removeItemsFromArray(item: "Mac-9394BDF4BF862EE7")
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
        let sortedAMDDictionary = AMDDictionary.keys.sorted()
        let sortedNvidiaDictionary = NvidiaDictionary.keys.sorted()
        
        AMDMenu.removeAllItems()
        AMDMenu.addItems(withTitles: sortedAMDDictionary)
        AMDMenu.selectItem(at: 0)
        NvidiaMenu.removeAllItems()
        NvidiaMenu.addItems(withTitles: sortedNvidiaDictionary)
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
        NvidiaCheck.isHidden = (sender.state == .on)
        nvidiaImage.isHidden = (sender.state == .on)
    }
    
    @IBAction func NvidiaChecked(_ sender: NSButton) {
        NvidiaMenu.isHidden = (sender.state == .off)
        AMDCheck.isHidden = (sender.state == .on)
        amdimage.isHidden = (sender.state == .on)
    }
    @IBAction func imageSelection(_ sender: Any) {
        let userSelected = machineSelected.titleOfSelectedItem
        switch userSelected {
        case "iMacPro1,1":
            smbiosImage.image = NSImage(named: "imacpro.png")
        case "MacPro4,1", "MacPro5,1":
            smbiosImage.image = NSImage(named: "macpro.png")
        case "iMac19,1", "iMac11,3", "iMac18,1", "iMac17,1", "iMac16,1", "iMac15,1", "iMac14,1", "iMac13,1", "iMac12,1", "iMac11,1", "iMac10,1", "iMac19,2", "iMac18,2",
             "iMac18,3", "iMac16,2", "iMac15,2", "iMac14,2", "iMac14,3", "iMac14,4", "iMac13,2", "iMac13,3", "iMac12,2", "iMac11,2":
            smbiosImage.image = NSImage(named: "imac.png")
        case "MacPro6,1":
            smbiosImage.image = NSImage(named: "macpro61.png")
        case "MacPro7,1":
            smbiosImage.image = NSImage(named: "macpro71.png")
        default:
            smbiosImage.image = NSImage(named: "")
        }
    }
    
    @IBAction func generateButton(_ sender: Any) {
        let getAGPMFilePathURL = URL.init(fileURLWithPath: getAGPMFilePath)
        // Decoder the AppleGraphicsPowerManagement.kext Info.plist and get some information to save as variable
        let data = try! Data(contentsOf: getAGPMFilePathURL)
        let plistData = try! plistDecoder.decode(PlistGet.self, from: data)
        let plistEncoder = PropertyListEncoder()
        plistEncoder.outputFormat = .xml
        // Create objects to represent the plist data to get encoded
        if AMDCheck.state == NSControl.StateValue.on {
            NvidiaMenu.state = NSControl.StateValue.off
            let amdGpu = AMDDictionary[AMDMenu.titleOfSelectedItem!]
            
            let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(stringValue: machineSelected!.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: setGpu.Gputype(stringValue: amdGpu!)!, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
            
            savePlist(encodable: plistToEncode)
        }
        
        if NvidiaCheck.state == NSControl.StateValue.on {
            AMDMenu.state = NSControl.StateValue.off
            let nvidiaGpu = NvidiaDictionary[NvidiaMenu.titleOfSelectedItem!]
            
            let plistToEncode = setPlist(buildMachineOSBuild: plistData.buildMachineOSBuild, cfBundleDevelopmentRegion: plistData.cfBundleDevelopmentRegion, cfBundleGetInfoString: plistData.cfBundleGetInfoString, cfBundleIdentifier: bundleID, cfBundleInfoDictionaryVersion: plistData.cfBundleInfoDictionaryVersion, cfBundleName: bundleName, cfBundlePackageType: plistData.cfBundlePackageType, cfBundleShortVersionString: bundleShortVersionName, cfBundleSignature: bundleSig, cfBundleVersion: plistData.cfBundleVersion, nsHumanReadableCopyright: plistData.nsHumanReadableCopyright, setIOKitPersonalities: setIOKitPersonalities(setAGPM: setAGPM(cfBundleIdentifier: plistData.IOKitPersonalities.AGPM.cfBundleIdentifier, ioClass: plistData.IOKitPersonalities.AGPM.ioClass, ioNameMatch: plistData.IOKitPersonalities.AGPM.ioNameMatch, ioProviderClass: plistData.IOKitPersonalities.AGPM.ioProviderClass, setMachines: setMachines(machine: setMachine(machinetype: setMachine.MachineType(stringValue: machineSelected!.titleOfSelectedItem!)!, setGPUs: setGpu(gpu: setGpu.Gputype(stringValue: nvidiaGpu!)!, agdcEnabled: AgdcEnabled, setHeuristic: setHeuristic(setID: setID), controlID: controlID, maxPowerState: maxPState, minPowerState: miniPState))))), osBundleRequired: plistData.osBundleRequired)
            
            savePlist(encodable: plistToEncode)
        }
    }
}

