//
//  ServiceInfo.swift
//  EpgTimerAPIKit
//
//  Created by petitstrawberry on 2023/06/10.
//

struct ServiceInfoItem: EntryItem {
    let serviceInfo: [ServiceInfo]

    enum CodingKeys: String, CodingKey {
        case serviceInfo = "serviceinfo"
    }
}

public struct ServiceInfo: Codable {
    public let onid: Int
    public let tsid: Int
    public let sid: Int
    public let serviceType: Int
    public let partialReceptionFlag: Int
    public let serviceProviderName: String
    public let serviceName: String
    public let networkName: String
    public let tsName: String
    public let remoteControlKeyID: Int

    enum CodingKeys: String, CodingKey {
        case onid = "ONID"
        case tsid = "TSID"
        case sid = "SID"
        case serviceType = "service_type"
        case partialReceptionFlag, serviceProviderName = "service_provider_name"
        case serviceName = "service_name"
        case networkName = "network_name"
        case tsName = "ts_name"
        case remoteControlKeyID = "remote_control_key_id"
    }
}
