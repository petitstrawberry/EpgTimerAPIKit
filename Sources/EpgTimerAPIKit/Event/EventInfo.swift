//
//  EventInfo.swift
//  EpgTimerAPIKit
//
//  Created by petitstrawberry on 2023/06/10.
//

struct EventInfoItem: EntryItem {
    let eventInfo: [EventInfo]

    enum CodingKeys: String, CodingKey {
        case eventInfo = "eventinfo"
    }
}

public struct EventInfo: Codable {
    public struct ContentInfo: Codable {
        public let nibble1: Int
        public let nibble2: Int
        public let componentTypeName: String

        enum CodingKeys: String, CodingKey {
            case nibble1, nibble2, componentTypeName = "component_type_name"
        }
    }

    public let onid: Int
    public let tsid: Int
    public let sid: Int
    public let eventID: Int
    public let serviceName: String
    public let startDate: String
    public let startTime: String
    public let startDayOfWeek: Int
    public let duration: Int
    public let eventName: String?
    public let eventText: String?
    public let contentInfo: [ContentInfo]
    public let freeCAFlag: Int

    enum CodingKeys: String, CodingKey {
        case onid = "ONID"
        case tsid = "TSID"
        case sid = "SID"
        case eventID
        case serviceName = "service_name"
        case startDate, startTime, startDayOfWeek, duration
        case eventName = "event_name"
        case eventText = "event_text"
        case contentInfo, freeCAFlag
    }
}
