# EpgTimerAPIKit
EpgTimer API Client for Swift

**注意**

まだこのライブラリはバージョン1.0どころか0.1.0に到達しておらず、基本的な設計すら確定していません。 今後の更新で大幅に変更される可能性があります。

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/petitstrawberry/EpgTimerAPIKit", from: "0.0.1")
  ],
```

## Example

```swift
let epgtimer = EpgTimer(baseURL: "http://epgtimer.local:5510")

let reserveClient = epgtimer.reserve
let reserveInfo = try await reserveClient.getReserveInfo()

// reserveInfoの中身を1つずつ表示
for info in reserveInfo {
    // 開始時刻とタイトルを表示
    print(info.startDate, info.startTime, info.title)
}
```

