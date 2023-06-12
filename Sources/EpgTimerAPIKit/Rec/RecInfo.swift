//
//  RecInfo.swift
//  EpgTimerAPIKit
//
//  Created by petitstrawberry on 2023/06/12.
//

struct RecInfoItem: EntryItem {
    let recInfo: [RecInfo]

    enum CodingKeys: String, CodingKey {
        case recInfo = "recinfo"
    }
}

public struct RecInfo: Codable {
    public let id: Int
    public let recFilePath: String
    public let title: String
    public let onid: Int
    public let tsid: Int
    public let sid: Int
    public let eventID: Int
    public let serviceName: String
    public let startDate: String
    public let startTime: String
    public let startDayOfWeek: Int
    public let duration: Int
    public let startDateEpg: String
    public let startTimeEpg: String
    public let startDayOfWeekEpg: Int
    public let drops: Int
    public let scrambles: Int
    public let recStatus: Int
    public let comment: String
    public let programInfo: String
    public let errInfo: String
    public let protect: Int

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case recFilePath, title
        case onid = "ONID"
        case tsid = "TSID"
        case sid = "SID"
        case eventID
        case serviceName = "service_name"
        case startDate, startTime, startDayOfWeek, duration
        case startDateEpg, startTimeEpg, startDayOfWeekEpg, drops, scrambles
        case recStatus, comment, programInfo, errInfo, protect
    }
}
