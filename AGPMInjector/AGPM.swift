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
}

struct IOKitPersonalities: Codable {
    var AGPM: AGPM
}

struct AGPM: Codable {
    var CFBundleIdentifier: String
    var IOClass: String
    var IONameMatch: String
    var IOProviderClass: String
}
