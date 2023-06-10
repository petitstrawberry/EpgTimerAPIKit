//
//  RecSetting.swift
//  EpgTimerAPIKit
//
//  Created by petitstrawberry on 2023/06/10.
//

struct RecSettingItem: EntryItem {
    let recSetting: [RecSetting]

    enum CodingKeys: String, CodingKey {
        case recSetting = "recsetting"
    }
}

public struct RecSetting: Codable {
    public let recMode: Int
    public let priority: Int
    public let tuijyuuFlag: Int
    public let serviceMode: Int
    public let pittariFlag: Int
    public let batFilePath: String
    public let recFolderList: String
    public let suspendMode: Int
    public let defserviceMode: Int
    public let rebootFlag: Int
    public let useMargineFlag: Int
    public let startMargine: Int
    public let endMargine: Int
    public let continueRecFlag: Int
    public let partialRecFlag: Int
    public let tunerID: Int
    public let partialRecFolder: String
}
