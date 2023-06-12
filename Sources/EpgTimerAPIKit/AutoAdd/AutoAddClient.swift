//
//  AutoAddClient.swift
//  EpgTimerAPIKit
//
//  Created by petitstrawberry on 2023/06/12.
//

import XMLCoder

public class AutoAddClient {
    private let client: EpgTimer.Client

    init(client: EpgTimer.Client) {
        self.client = client
    }

    // AutoAddInfo
    public func getAutoAddInfo() async throws -> [AutoAddInfo] {
        let request = client.session.request("\(client.baseURL)/api/EnumAutoAdd")
        let response = await request.serializingData().response
        switch response.result {
        case .success:
            let entry: Entry<AutoAddInfoItem> = try XMLDecoder().decode(Entry<AutoAddInfoItem>.self, from: response.data!)

            return entry.items.autoAddInfo

        case let .failure(error):
            print(error)
            return []
        }
    }
}
