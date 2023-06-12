//
//  RecClient.swift
//  EpgTimerAPIKit
//
//  Created by petitstrawberry on 2023/06/12.
//

import XMLCoder

public class RecClient {
    private let client: EpgTimer.Client

    init(client: EpgTimer.Client) {
        self.client = client
    }

    // RecInfo
    public func getRecInfo() async throws -> [RecInfo] {
        let request = client.session.request("\(client.baseURL)/api/EnumRecInfo")
        let response = await request.serializingData().response
        switch response.result {
        case .success:
            let entry: Entry<RecInfoItem> = try XMLDecoder().decode(Entry<RecInfoItem>.self, from: response.data!)

            return entry.items.recInfo

        case let .failure(error):
            print(error)
            return []
        }
    }
}
