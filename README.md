# TailwindColorKit

![Swift](https://img.shields.io/badge/Swift-5.6+-orange.svg)
![Platforms](https://img.shields.io/badge/Platforms-iOS%20%7C%20macOS%20%7C%20tvOS%20%7C%20watchOS-lightgrey.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

TailwindColorKit 是一个 Swift 库，为 SwiftUI 应用提供了完整的 Tailwind CSS 颜色系统实现。通过这个库，你可以轻松地在 iOS、macOS、tvOS 和 watchOS 应用中使用 Tailwind 的标准颜色。

## 特性

- **完整的 Tailwind 颜色系统** - 包含所有 Tailwind CSS v4 标准颜色
- **支持所有色阶** - 从 50 到 950
- **类型安全** - 通过枚举和静态类型保证颜色安全
- **暗黑模式支持** - 自动适配系统外观设置
- **轻量级** - 无额外依赖，纯 Swift 实现

## 安装

### Swift Package Manager

在 Package.swift 文件中添加以下依赖：

```swift
dependencies: [
    .package(url: "https://github.com/yourusername/TailwindColorKit.git", from: "1.0.4")
]
```

## 快速开始

```swift
import SwiftUI
import TailwindColorKit

struct ContentView: View {
    var body: some View {
        VStack {
            // 使用预定义颜色
            Rectangle()
                .fill(Color.orange500)
                .frame(width: 100, height: 100)
            
            // 使用便捷方法
            Text("Hello Tailwind")
                .foregroundColor(.tailwind(.yellow, .s100))
                .padding()
                .background(Color.blue500)
        }
        .frame(width: 300, height: 500)
        .background(Color.slate800)
    }
}
```

## 颜色参考

TailwindColorKit 提供以下颜色家族：

- Slate
- Gray
- Zinc
- Neutral
- Stone
- Red
- Orange
- Amber
- Yellow
- Lime
- Green
- Emerald
- Teal
- Cyan
- Sky
- Blue
- Indigo
- Violet
- Purple
- Fuchsia
- Pink
- Rose

每个颜色家族都提供 50、100、200、300、400、500、600、700、800、900 和 950 色阶。

## 贡献

欢迎贡献！请提交 issue 或 pull request。

## 许可证

TailwindColorKit 使用 MIT 许可证。详见 [LICENSE](LICENSE) 文件。

---

**TailwindColorKit** 由 [SwiftUI训练营] 开发，灵感来自 Tailwind CSS 颜色系统。
