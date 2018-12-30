import Foundation

struct GetAGPMInfo: Codable {
    var BuildMachineOSBuild: String
    var CFBundleDevelopmentRegion: String
    var CFBundleGetInfoString: String
    var CFBundleIdentifier: String
    var CFBundleInfoDictionaryVersion: String
    var CFBundleName: String
    var CFBundlePackageType: String
    var CFBundleShortVersionString: String
    var CFBundleSignature: String
    var CFBundleVersion: String
    var NSHumanReadableCopyright: String
    var IOKitPersonalities: IOKitPersonalities
    var OSBundleRequired: String
    
    enum CodingKeys: String, CodingKey {
        case BuildMachineOSBuild
        case CFBundleDevelopmentRegion
        case CFBundleGetInfoString
        case CFBundleIdentifier
        case CFBundleInfoDictionaryVersion
        case CFBundleName
        case CFBundlePackageType
        case CFBundleShortVersionString
        case CFBundleSignature
        case CFBundleVersion
        case NSHumanReadableCopyright
        case IOKitPersonalities
        case OSBundleRequired
    }
    
    struct IOKitPersonalities: Codable {
        var AGPM: AGPM
        
        struct AGPM: Codable {
            var CFBundleIdentifier: String
            var IOClass: String
            var IONameMatch: String
            var IOProviderClass: String
            var Machines: Machines
            
            enum CodingKeys: String, CodingKey {
                case CFBundleIdentifier
                case IOClass
                case IONameMatch
                case IOProviderClass
                case Machines
            }
            
            struct Machines: Codable {
                var MacF60DEB81FF30ACF6: String?
                
                enum CodingKeys: String, CodingKey {
                    case MacF60DEB81FF30ACF6 = "Mac-F60DEB81FF30ACF6"
                }
            }
        }
    }
}
