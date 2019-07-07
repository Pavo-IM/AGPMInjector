//
//  setPlist.swift
//  AGPMInjector
//
//  Created by Henry Brock on 7/7/19.
//  Copyright © 2019 Pavo. All rights reserved.
//

import Foundation


struct setPlist: Encodable {
    let buildMachineOSBuild, cfBundleDevelopmentRegion, cfBundleGetInfoString, cfBundleIdentifier: String
    let cfBundleInfoDictionaryVersion, cfBundleName, cfBundlePackageType, cfBundleShortVersionString: String
    let cfBundleSignature, cfBundleVersion, nsHumanReadableCopyright: String
    let setIOKitPersonalities: setIOKitPersonalities
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
        case setIOKitPersonalities = "IOKitPersonalities"
        case osBundleRequired = "OSBundleRequired"
    }
}

struct setIOKitPersonalities: Encodable {
    let setAGPM: setAGPM
    
    enum CodingKeys: String, CodingKey {
        case setAGPM = "AGPM"
    }
}

struct setAGPM: Encodable {
    let cfBundleIdentifier, ioClass, ioNameMatch, ioProviderClass: String
    let setMachines: setMachines
    enum CodingKeys: String, CodingKey {
        case cfBundleIdentifier = "CFBundleIdentifier"
        case ioClass = "IOClass"
        case ioNameMatch = "IONameMatch"
        case ioProviderClass = "IOProviderClass"
        case setMachines = "Machines"
    }
}

struct setMachines: Encodable {
    let machine: setMachine
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: setMachine.MachineType.self)
        try container.encode(machine, forKey: machine.type)
    }
}

struct setMachine: Encodable {
    let type: MachineType
    let gfx: gfx
    
    enum CodingKeys: String, CodingKey {
        case gfx = "GFX0"
    }
    
    enum MachineType: String, CodingKey, Codable {
        case iMacPro11 = "iMacPro1,1"
        case macPro51 = "MacPro5,1"
        case macPro41 = "MacPro4,1"
        case macPro61 = "MacPro6,1"
        case iMac101 = "iMac10,1"
        case iMac111 = "iMac11,1"
        case iMac112 = "iMac11,2"
        case iMac113 = "iMac11,3"
        case iMac121 = "iMac12,1"
        case iMac122 = "iMac12,2"
        case iMac131 = "iMac13,1"
        case iMac132 = "iMac13,2"
        case iMac133 = "iMac13,3"
        case iMac141 = "iMac14,1"
        case iMac142 = "iMac14,2"
        case iMac143 = "iMac14,3"
        case iMac144 = "iMac14,4"
        case iMac151 = "iMac15,1"
        case iMac152 = "iMac15,2"
        case iMac161 = "iMac16,1"
        case iMac162 = "iMac16,2"
        case iMac171 = "iMac17,1"
        case iMac181 = "iMac18,1"
        case iMac182 = "iMac18,2"
        case iMac183 = "iMac18,3"
        case iMac191 = "iMac19,1"
        case iMac192 = "iMac19,2"
     }
}

struct gfx: Encodable {
    let agdcEnabled: Int
    let setHeuristic: setHeuristic
    let controlID: Int
    let maxPowerState: Int
    let minPowerState: Int
    
    enum CodingKeys: String, CodingKey {
        case agdcEnabled = "AGDCEnabled"
        case setHeuristic = "Heuristic"
        case controlID = "control-id"
        case maxPowerState = "max-power-state"
        case minPowerState = "min-power-state"
    }
}

struct setHeuristic: Encodable {
    let setID: Int
    
    enum CodingKeys: String, CodingKey {
        case setID = "ID"
    }
}
