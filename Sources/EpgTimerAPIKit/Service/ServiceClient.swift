//
//  ServiceClient.swift
//  EpgTimerAPIKit
//
//  Created by petitstrawberry on 2023/06/10.
//

import XMLCoder

public class ServiceClient {
    private let client: EpgTimer.Client

    init(client: EpgTimer.Client) {
        self.client = client
    }

    // ServiceInfo
    public func getServiceInfo() async throws -> [ServiceInfo] {
        let request = client.session.request("\(client.baseURL)/api/EnumService")
        let response = await request.serializingData().response
        switch response.result {
        case .success:
            let entry: Entry<ServiceInfoItem> = try XMLDecoder().decode(Entry<ServiceInfoItem>.self, from: response.data!)

            return entry.items.serviceInfo

        case let .failure(error):
            print(error)
            return []
        }
    }
}
