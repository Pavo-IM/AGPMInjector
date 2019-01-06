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
