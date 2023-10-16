//
//  AutoAddInfo.swift
//  EpgTimerAPIKit
//
//  Created by petitstrawberry on 2023/06/12.
//

struct AutoAddInfoItem: EntryItem {
    let autoAddInfo: [AutoAddInfo]

    enum CodingKeys: String, CodingKey {
        case autoAddInfo = "autoaddinfo"
    }
}

public struct AutoAddInfo: Codable {
    public let id: Int
    public let searchSetting: SearchSetting
    public let recSetting: RecSetting

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case searchSetting = "searchsetting"
        case recSetting = "recsetting"
    }
}

public struct SearchSetting: Codable {
    public let disableFlag: Int
    public let caseFlag: Int
    public let andKey: String
    public let notKey: String
    public let regExpFlag: Int
    public let titleOnlyFlag: Int
    public let aimaiFlag: Int
    public let notContetFlag: Int
    public let notDateFlag: Int
    public let freeCAFlag: Int
    public let chkRecEnd: Int
    public let chkRecDay: Int
    public let chkRecNoService: Int
    public let chkDurationMin: Int
    public let chkDurationMax: Int
    public let contentList: [Content]
    public let dateList: [Date]
    public let serviceList: [Service]

    enum CodingKeys: String, CodingKey {
        case disableFlag, caseFlag, andKey, notKey, regExpFlag
        case titleOnlyFlag, aimaiFlag, notContetFlag, notDateFlag
        case freeCAFlag, chkRecEnd, chkRecDay, chkRecNoService
        case chkDurationMin, chkDurationMax
        case contentList, dateList, serviceList
    }

    public struct Content: Codable {
        public let contentNibble: Int
        public let userNibble: Int

        enum CodingKeys: String, CodingKey {
            case contentNibble = "content_nibble"
            case userNibble = "user_nibble"
        }
    }

    public struct Date: Codable {
        public let startDayOfWeek: Int
        public let startHour: Int
        public let startMin: Int
        public let endDayOfWeek: Int
        public let endHour: Int
        public let endMin: Int

        enum CodingKeys: String, CodingKey {
            case startDayOfWeek, startHour, startMin
            case endDayOfWeek, endHour, endMin
        }
    }

    public struct Service: Codable {
        public let onid: Int
        public let tsid: Int
        public let sid: Int

        enum CodingKeys: String, CodingKey {
            case onid, tsid, sid
        }
    }
}
