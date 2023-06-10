// The Swift Programming Language
// https://docs.swift.org/swift-book

import Alamofire
import Foundation
import XMLCoder

public class EpgTimer {
    public static let version = "0.0.1"

    struct Client {
        let baseURL: String
        let session: Session
    }

    public let reserve: ReserveClient
    public let service: ServiceClient
    public let event: EventClient
    public let recPreset: RecPresetClient

    // MARK: - Initializer

    public init(baseURL: String) {
        let client = Client(baseURL: baseURL, session: .default)
        reserve = ReserveClient(client: client)
        service = ServiceClient(client: client)
        event = EventClient(client: client)
        recPreset = RecPresetClient(client: client)
    }

    public init(baseURL: String, session: Session) {
        let client = Client(baseURL: baseURL, session: session)
        reserve = ReserveClient(client: client)
        service = ServiceClient(client: client)
        event = EventClient(client: client)
        recPreset = RecPresetClient(client: client)
    }
}
