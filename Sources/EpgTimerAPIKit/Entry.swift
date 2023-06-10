//
//  Entry.swift
//  EpgTimerAPIKit
//
//  Created by petitstrawberry on 2023/06/10.
//

typealias EntryItem = Codable

struct Entry<T: EntryItem>: Codable {
    let total: Int
    let index: Int
    let count: Int
    let items: T
}
