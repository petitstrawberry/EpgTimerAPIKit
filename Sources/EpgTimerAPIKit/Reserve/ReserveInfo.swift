//
//  ReserveInfo.swift
//  EpgTimerAPIKit
//
//  Created by petitstrawberry on 2023/06/10.
//

struct ReserveInfoItem: EntryItem {
    let reserveInfo: [ReserveInfo]

    enum CodingKeys: String, CodingKey {
        case reserveInfo = "reserveinfo"
    }
}

public struct ReserveInfo: Codable {
    public let id: Int
    public let title: String
    public let startDate: String
    public let startTime: String
    public let startDayOfWeek: Int
    public let duration: Int
    public let serviceName: String
    public let onid: Int
    public let tsid: Int
    public let sid: Int
    public let eventID: Int
    public let comment: String
    public let overlapMode: Int
    public let recSetting: RecSetting
    public let recFileNameList: String

    // Define coding keys if property names don't match the XML tags
    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case title
        case startDate
        case startTime
        case startDayOfWeek
        case duration
        case serviceName = "service_name"
        case onid = "ONID"
        case tsid = "TSID"
        case sid = "SID"
        case eventID
        case comment
        case overlapMode
        case recSetting = "recsetting"
        case recFileNameList
    }
}
