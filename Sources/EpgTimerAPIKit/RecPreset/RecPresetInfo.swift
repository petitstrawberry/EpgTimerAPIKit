//
//  RecPresetInfo.swift
//  EpgTimerAPIKit
//
//  Created by petitstrawberry on 2023/06/10.
//

public struct RecPresetInfoItem: EntryItem {
    public let recPresetInfo: [RecPresetInfo]

    enum CodingKeys: String, CodingKey {
        case recPresetInfo = "recpresetinfo"
    }
}

public struct RecPresetInfo: Codable {
    public let id: Int
    public let name: String
    public let recSetting: RecSetting

    enum CodingKeys: String, CodingKey {
        case id, name
        case recSetting = "recsetting"
    }
}
