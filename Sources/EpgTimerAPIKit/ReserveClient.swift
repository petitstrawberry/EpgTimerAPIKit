import XMLCoder

public class ReserveClient {
    private let client: EpgTimer.Client

    init(client: EpgTimer.Client) {
        self.client = client
    }

    // ReserveInfo
    public func getReserveInfo() async throws -> [ReserveInfo] {
        let request = client.session.request("\(client.baseURL)/api/EnumReserveInfo")
        let response = await request.serializingData()

            .response
        switch response.result {
        case .success:
            let entry: Entry<ReserveInfoItem> = try XMLDecoder().decode(Entry<ReserveInfoItem>.self, from: response.data!)

            return entry.items.map {
                $0.reserveInfo
            }
        case let .failure(error):
            print(error)
            return []
        }
    }
}
