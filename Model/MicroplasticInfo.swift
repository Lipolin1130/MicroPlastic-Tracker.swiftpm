//
//  MicroplasticInfo.swift
//  MicroPlastic Tracker
//
//  Created by 李柏霖 on 2025/2/13.
//

struct MicroplasticInfo {
    let name: MicroplasticInfoType
    let imageName: String
    let introduction: String
}

enum MicroplasticInfoType: String {
    case microbeads = "Microbead"
    case microfibers = "Microfiber"
    case microfragments = "Plastic Fragment"
}
