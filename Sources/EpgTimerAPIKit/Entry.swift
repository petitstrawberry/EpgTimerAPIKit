typealias EntryItem = Codable

struct Entry<T: EntryItem>: Codable {
    let total: Int
    let index: Int
    let count: Int
    let items: [T]
}
