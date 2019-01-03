import Foundation

struct PlistGet: Codable {
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
    
    struct IOKitPersonalities: Codable {
        let AGPM: AGPM
        
        struct AGPM: Codable {
            let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
            let Machines: [String: Machines]
            
            enum CodingKeys: String, CodingKey {
                case cfBundleIdentifier = "CFBundleIdentifier"
                case ioClass = "IOClass"
                case ioNameMatch = "IONameMatch"
                case ioProviderClass = "IOProviderClass"
                case Machines
            }
            
            struct Machines: Codable {
            }
        }
    }
}

struct PlistSet: Codable {
    let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
    let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
    let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
    let ioKitPersonalities: IOKitPersonalities
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
        case ioKitPersonalities = "IOKitPersonalities"
        case osBundleRequired = "OSBundleRequired"
    }
    
    struct IOKitPersonalities: Codable {
        let AGPM: AGPM
        
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
            
            struct Machines: Codable {
                let macPro61: macPro61
                
                enum CodingKeys: String, CodingKey {
                    case macPro61 = "MacPro6,1"
                }
                
                struct macPro61: Codable {
                    let Gfx0: Gfx0
                    
                    enum CodingKeys: String, CodingKey {
                        case Gfx0 = "GFX0"
                    }
                    
                    struct Gfx0: Codable {
                        let agdcEnabled: Int
                        let heuristic: Heuristic
                        let maxPowerState, minPowerState, controlID: Int
                        
                        enum CodingKeys: String, CodingKey {
                            case agdcEnabled = "AGDCEnabled"
                            case heuristic = "Heuristic"
                            case maxPowerState = "max-power-state"
                            case minPowerState = "min-power-state"
                            case controlID = "control-id"
                        }
                        
                        struct Heuristic: Codable {
                            let id: Int
                            
                            enum CodingKeys: String, CodingKey {
                                case id = "ID"
                            }
                        }
                    }
                }
            }
        }
    }
}
