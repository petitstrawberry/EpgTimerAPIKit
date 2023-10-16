//
//  EventClient.swift
//  EpgTimerAPIKit
//
//  Created by petitstrawberry on 2023/06/10.
//

import Foundation
import XMLCoder

public class EventClient {
    private let client: EpgTimer.Client

    init(client: EpgTimer.Client) {
        self.client = client
    }

    /// 全てのイベント情報を取得
    /// - Throws: Alamofire.AFError
    /// - Returns: イベント情報
    public func getEventInfo() async throws -> [EventInfo] {
        let request = client.session.request("\(client.baseURL)/api/EnumEventInfo?basic=0")
        let response = await request.serializingData().response
        switch response.result {
        case .success:
            let entry: Entry<EventInfoItem> = try XMLDecoder().decode(Entry<EventInfoItem>.self, from: response.data!)

            return entry.items.eventInfo

        case let .failure(error):
            print(error)
            return []
        }
    }

    /// 指定のサービスのイベント情報を取得
    /// - Parameters:
    ///   - onid: Original Network ID
    ///   - tsid: Transport Stream ID
    ///   - sid: Service ID
    ///   - count: 取得するイベント数
    /// - Throws: Alamofire.AFError
    /// - Returns: イベント情報

    public func getEventInfo(onid: Int, tsid: Int, sid: Int, count: Int) async throws -> [EventInfo] {
        let request = client.session.request("\(client.baseURL)/api/EnumEventInfo?basic=0&onid=\(onid)&tsid=\(tsid)&sid=\(sid)&count=\(count)")
        let response = await request.serializingData().response
        switch response.result {
        case .success:
            let entry: Entry<EventInfoItem> = try XMLDecoder().decode(Entry<EventInfoItem>.self, from: response.data!)

            return entry.items.eventInfo

        case let .failure(error):
            print(error)
            return []
        }
    }

    /// 指定のサービスのイベント情報を取得
    /// - Parameters:
    ///   - serviceInfo: 指定するサービス
    ///   - count: 取得するイベント数
    /// - Throws: Alamofire.AFError
    /// - Returns: イベント情報
    public func getEventInfo(onid: Int, tsid: Int, sid: Int) async throws -> [EventInfo] {
        let request = client.session.request("\(client.baseURL)/api/EnumEventInfo?basic=0&onid=\(onid)&tsid=\(tsid)&sid=\(sid)")
        let response = await request.serializingData().response
        switch response.result {
        case .success:
            let entry: Entry<EventInfoItem> = try XMLDecoder().decode(Entry<EventInfoItem>.self, from: response.data!)

            return entry.items.eventInfo

        case let .failure(error):
            print(error)
            return []
        }
    }

    /// 指定のサービスのイベント情報を取得
    /// - Parameters:
    ///   - serviceInfo: 指定するサービス
    ///   - count: 取得するイベント数
    /// - Throws: Alamofire.AFError
    /// - Returns: イベント情報
    public func getEventInfo(serviceInfo: ServiceInfo, count: Int) async throws -> [EventInfo] {
        return try await getEventInfo(onid: serviceInfo.onid, tsid: serviceInfo.tsid, sid: serviceInfo.sid, count: count)
    }

    /// 指定のサービスの全てのイベント情報を取得
    /// - Parameters:
    ///  - serviceInfo: 指定するサービス
    /// - Throws: Alamofire.AFError
    /// - Returns: イベント情報
    public func getEventInfo(serviceInfo: ServiceInfo) async throws -> [EventInfo] {
        return try await getEventInfo(onid: serviceInfo.onid, tsid: serviceInfo.tsid, sid: serviceInfo.sid)
    }

    /// 指定サービスで現在放送中のイベント情報を取得
    /// - Parameters:
    ///   - onid: Original Network ID
    ///   - tsid: Transport Stream ID
    ///   - sid: Service ID
    ///   - count: 取得するイベント数
    /// - Throws: Alamofire.AFError
    /// - Returns: 現在放送中のイベント情報とその次のイベント情報
    public func getEventInfoOnAir(onid: Int, tsid: Int, sid: Int) async throws -> [EventInfo] {
        let request = client.session.request("\(client.baseURL)/api/EnumEventInfo?basic=0&onair=&onid=\(onid)&tsid=\(tsid)&sid=\(sid)")
        let response = await request.serializingData().response
        switch response.result {
        case .success:
            let entry: Entry<EventInfoItem> = try XMLDecoder().decode(Entry<EventInfoItem>.self, from: response.data!)

            return entry.items.eventInfo

        case let .failure(error):
            print(error)
            return []
        }
    }

    /// 指定サービスで現在放送中のイベント情報を取得
    /// - Parameters:
    ///   - serviceInfo: 指定するサービス
    /// - Throws: Alamofire.AFError
    /// - Returns: 現在放送中のイベント情報とその次のイベント情報
    public func getEventInfoOnAir(serviceInfo: ServiceInfo) async throws -> [EventInfo] {
        return try await getEventInfoOnAir(onid: serviceInfo.onid, tsid: serviceInfo.tsid, sid: serviceInfo.sid)
    }

    /// 指定番組のイベント情報を取得
    /// - Parameters:
    ///   - onid: Original Network ID
    ///   - tsid: Transport Stream ID
    ///   - sid: Service ID
    ///   - eid: Event ID
    /// - Throws: Alamofire.AFError
    /// - Returns: 指定番組のイベント情報
    public func getEventInfo(onid: Int, tsid: Int, sid: Int, eid: Int) async throws -> EventInfo? {
        let request = client.session.request("\(client.baseURL)/api/EnumEventInfo?basic=0&onid=\(onid)&tsid=\(tsid)&sid=\(sid)&eid=\(eid)")
        let response = await request.serializingData().response
        switch response.result {
        case .success:
            let entry: Entry<EventInfoItem> = try XMLDecoder().decode(Entry<EventInfoItem>.self, from: response.data!)

            return entry.items.eventInfo[0]

        case let .failure(error):
            print(error)
            return nil
        }
    }
}
