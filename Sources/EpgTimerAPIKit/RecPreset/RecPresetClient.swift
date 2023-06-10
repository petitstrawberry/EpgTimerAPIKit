//
//  RecPresetClient.swift
//  EpgTimerAPIKit
//
//  Created by petitstrawberry on 2023/06/10.
//

import XMLCoder

public class RecPresetClient {
    private let client: EpgTimer.Client

    init(client: EpgTimer.Client) {
        self.client = client
    }

    // RecPresetInfo
    public func getRecPresetInfo() async throws -> [RecPresetInfo] {
        let request = client.session.request("\(client.baseURL)/api/EnumRecPreset")
        let response = await request.serializingData().response
        switch response.result {
        case .success:
            let entry: Entry<RecPresetInfoItem> = try XMLDecoder().decode(Entry<RecPresetInfoItem>.self, from: response.data!)

            return entry.items.recPresetInfo

        case let .failure(error):
            print(error)
            return []
        }
    }
}
