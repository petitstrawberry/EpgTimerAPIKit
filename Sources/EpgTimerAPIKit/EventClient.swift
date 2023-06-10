import XMLCoder

public class EventClient {
    private let client: EpgTimer.Client

    init(client: EpgTimer.Client) {
        self.client = client
    }

    // EventInfo
    public func getEventInfo() async throws -> [EventInfo] {
        let request = client.session.request("\(client.baseURL)/api/EnumEventInfo")
        let response = await request.serializingData().response
        switch response.result {
        case .success:
            let entry: Entry<EventInfoItem> = try XMLDecoder().decode(Entry<EventInfoItem>.self, from: response.data!)

            return entry.items.map {
                $0.eventInfo
            }
        case let .failure(error):
            print(error)
            return []
        }
    }
}
