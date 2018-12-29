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
    
    enum IOKitPersonalitiesCodingKeys: String, CodingKey {
        case AGPM
    }
    
    enum AGPMCodingKeys: String, CodingKey {
        case CFBundleIdentifier
        case IOClass
        case IONameMatch
        case IOProviderClass
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        BuildMachineOSBuild = try container.decode(String.self, forKey: .BuildMachineOSBuild)
        CFBundleDevelopmentRegion = try container.decode(String.self, forKey: .CFBundleDevelopmentRegion)
        CFBundleGetInfoString = try container.decode(String.self, forKey: .CFBundleGetInfoString)
        CFBundleIdentifier = try container.decode(String.self, forKey: .CFBundleIdentifier)
        CFBundleInfoDictionaryVersion = try container.decode(String.self, forKey: .CFBundleInfoDictionaryVersion)
        CFBundleName = try container.decode(String.self, forKey: .CFBundleName)
        CFBundlePackageType = try container.decode(String.self, forKey: .CFBundlePackageType)
        CFBundleShortVersionString = try container.decode(String.self, forKey: .CFBundleShortVersionString)
        CFBundleSignature = try container.decode(String.self, forKey: .CFBundleSignature)
        CFBundleVersion = try container.decode(String.self, forKey: .CFBundleVersion)
        NSHumanReadableCopyright = try container.decode(String.self, forKey: .NSHumanReadableCopyright)
        let IOKitPersonalities = try container.nestedContainer(keyedBy: IOKitPersonalitiesCodingKeys.self, forKey: .IOKitPersonalities)
        OSBundleRequired = try container.decode(String.self, forKey: .OSBundleRequired)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(BuildMachineOSBuild, forKey: .BuildMachineOSBuild)
        try container.encode(CFBundleDevelopmentRegion, forKey: .CFBundleDevelopmentRegion)
        try container.encode(CFBundleGetInfoString, forKey: .CFBundleGetInfoString)
        try container.encode(CFBundleIdentifier, forKey: .CFBundleIdentifier)
        try container.encode(CFBundleInfoDictionaryVersion, forKey: .CFBundleInfoDictionaryVersion)
        try container.encode(CFBundleName, forKey: .CFBundleName)
        try container.encode(CFBundlePackageType, forKey: .CFBundlePackageType)
        try container.encode(CFBundleShortVersionString, forKey: .CFBundleShortVersionString)
        try container.encode(CFBundleSignature, forKey: .CFBundleSignature)
        try container.encode(CFBundleVersion, forKey: .CFBundleVersion)
        try container.encode(NSHumanReadableCopyright, forKey: .NSHumanReadableCopyright)
        var IOKitPersonalities = container.nestedContainer(keyedBy: IOKitPersonalitiesCodingKeys.self, forKey: .IOKitPersonalities)
        try container.encode(OSBundleRequired, forKey: .OSBundleRequired)
    }
}
