// The Swift Programming Language
// https://docs.swift.org/swift-book

//
// Created by devlink on 2025/7/18.
//

import SwiftUI

struct TailwindColor {
    // 基础颜色枚举
    enum BaseColor: String, CaseIterable {
        case slate, gray, zinc, neutral, stone
        case red, orange, amber, yellow, lime
        case green, emerald, teal, cyan, sky
        case blue, indigo, violet, purple, fuchsia
        case pink, rose
    }
    
    // 颜色深浅等级 (50-950)
    enum Shade: Int, CaseIterable {
        case s50 = 50
        case s100 = 100
        case s200 = 200
        case s300 = 300
        case s400 = 400
        case s500 = 500
        case s600 = 600
        case s700 = 700
        case s800 = 800
        case s900 = 900
        case s950 = 950
    }
    
    let base: BaseColor
    let shade: Shade
    
    // 颜色HEX值字典
    private static let colorHexValues: [BaseColor: [Shade: String]] = [
        // Slate
        .slate: [
            .s50: "#f8fafc", .s100: "#f1f5f9", .s200: "#e2e8f0",
            .s300: "#cbd5e1", .s400: "#94a3b8", .s500: "#64748b",
            .s600: "#475569", .s700: "#334155", .s800: "#1e293b",
            .s900: "#0f172a", .s950: "#020617"
        ],
        // Gray
        .gray: [
            .s50: "#f9fafb", .s100: "#f3f4f6", .s200: "#e5e7eb",
            .s300: "#d1d5db", .s400: "#9ca3af", .s500: "#6b7280",
            .s600: "#4b5563", .s700: "#374151", .s800: "#1f2937",
            .s900: "#111827", .s950: "#030712"
        ],
        // Zinc
        .zinc: [
            .s50: "#fafafa", .s100: "#f4f4f5", .s200: "#e4e4e7",
            .s300: "#d4d4d8", .s400: "#a1a1aa", .s500: "#71717a",
            .s600: "#52525b", .s700: "#3f3f46", .s800: "#27272a",
            .s900: "#18181b", .s950: "#09090b"
        ],
        // Neutral
        .neutral: [
            .s50: "#fafafa", .s100: "#f5f5f5", .s200: "#e5e5e5",
            .s300: "#d4d4d4", .s400: "#a3a3a3", .s500: "#737373",
            .s600: "#525252", .s700: "#404040", .s800: "#262626",
            .s900: "#171717", .s950: "#0a0a0a"
        ],
        // Stone
        .stone: [
            .s50: "#fafaf9", .s100: "#f5f5f4", .s200: "#e7e5e4",
            .s300: "#d6d3d1", .s400: "#a8a29e", .s500: "#78716c",
            .s600: "#57534e", .s700: "#44403c", .s800: "#292524",
            .s900: "#1c1917", .s950: "#0c0a09"
        ],
        // Red
        .red: [
            .s50: "#fef2f2", .s100: "#fee2e2", .s200: "#fecaca",
            .s300: "#fca5a5", .s400: "#f87171", .s500: "#ef4444",
            .s600: "#dc2626", .s700: "#b91c1c", .s800: "#991b1b",
            .s900: "#7f1d1d", .s950: "#450a0a"
        ],
        // Orange
        .orange: [
            .s50: "#fff7ed", .s100: "#ffedd5", .s200: "#fed7aa",
            .s300: "#fdba74", .s400: "#fb923c", .s500: "#f97316",
            .s600: "#ea580c", .s700: "#c2410c", .s800: "#9a3412",
            .s900: "#7c2d12", .s950: "#431407"
        ],
        // Amber
        .amber: [
            .s50: "#fffbeb", .s100: "#fef3c7", .s200: "#fde68a",
            .s300: "#fcd34d", .s400: "#fbbf24", .s500: "#f59e0b",
            .s600: "#d97706", .s700: "#b45309", .s800: "#92400e",
            .s900: "#78350f", .s950: "#451a03"
        ],
        // Yellow
        .yellow: [
            .s50: "#fefce8", .s100: "#fef9c3", .s200: "#fef08a",
            .s300: "#fde047", .s400: "#facc15", .s500: "#eab308",
            .s600: "#ca8a04", .s700: "#a16207", .s800: "#854d0e",
            .s900: "#713f12", .s950: "#422006"
        ],
        // Lime
        .lime: [
            .s50: "#f7fee7", .s100: "#ecfccb", .s200: "#d9f99d",
            .s300: "#bef264", .s400: "#a3e635", .s500: "#84cc16",
            .s600: "#65a30d", .s700: "#4d7c0f", .s800: "#3f6212",
            .s900: "#365314", .s950: "#1a2e05"
        ],
        // Green
        .green: [
            .s50: "#f0fdf4", .s100: "#dcfce7", .s200: "#bbf7d0",
            .s300: "#86efac", .s400: "#4ade80", .s500: "#22c55e",
            .s600: "#16a34a", .s700: "#15803d", .s800: "#166534",
            .s900: "#14532d", .s950: "#052e16"
        ],
        // Emerald
        .emerald: [
            .s50: "#ecfdf5", .s100: "#d1fae5", .s200: "#a7f3d0",
            .s300: "#6ee7b7", .s400: "#34d399", .s500: "#10b981",
            .s600: "#059669", .s700: "#047857", .s800: "#065f46",
            .s900: "#064e3b", .s950: "#022c22"
        ],
        // Teal
        .teal: [
            .s50: "#f0fdfa", .s100: "#ccfbf1", .s200: "#99f6e4",
            .s300: "#5eead4", .s400: "#2dd4bf", .s500: "#14b8a6",
            .s600: "#0d9488", .s700: "#0f766e", .s800: "#115e59",
            .s900: "#134e4a", .s950: "#042f2e"
        ],
        // Cyan
        .cyan: [
            .s50: "#ecfeff", .s100: "#cffafe", .s200: "#a5f3fc",
            .s300: "#67e8f9", .s400: "#22d3ee", .s500: "#06b6d4",
            .s600: "#0891b2", .s700: "#0e7490", .s800: "#155e75",
            .s900: "#164e63", .s950: "#083344"
        ],
        // Sky
        .sky: [
            .s50: "#f0f9ff", .s100: "#e0f2fe", .s200: "#bae6fd",
            .s300: "#7dd3fc", .s400: "#38bdf8", .s500: "#0ea5e9",
            .s600: "#0284c7", .s700: "#0369a1", .s800: "#075985",
            .s900: "#0c4a6e", .s950: "#082f49"
        ],
        // Blue
        .blue: [
            .s50: "#eff6ff", .s100: "#dbeafe", .s200: "#bfdbfe",
            .s300: "#93c5fd", .s400: "#60a5fa", .s500: "#3b82f6",
            .s600: "#2563eb", .s700: "#1d4ed8", .s800: "#1e40af",
            .s900: "#1e3a8a", .s950: "#172554"
        ],
        // Indigo
        .indigo: [
            .s50: "#eef2ff", .s100: "#e0e7ff", .s200: "#c7d2fe",
            .s300: "#a5b4fc", .s400: "#818cf8", .s500: "#6366f1",
            .s600: "#4f46e5", .s700: "#4338ca", .s800: "#3730a3",
            .s900: "#312e81", .s950: "#1e1b4b"
        ],
        // Violet
        .violet: [
            .s50: "#f5f3ff", .s100: "#ede9fe", .s200: "#ddd6fe",
            .s300: "#c4b5fd", .s400: "#a78bfa", .s500: "#8b5cf6",
            .s600: "#7c3aed", .s700: "#6d28d9", .s800: "#5b21b6",
            .s900: "#4c1d95", .s950: "#2e1065"
        ],
        // Purple
        .purple: [
            .s50: "#faf5ff", .s100: "#f3e8ff", .s200: "#e9d5ff",
            .s300: "#d8b4fe", .s400: "#c084fc", .s500: "#a855f7",
            .s600: "#9333ea", .s700: "#7e22ce", .s800: "#6b21a8",
            .s900: "#581c87", .s950: "#3b0764"
        ],
        // Fuchsia
        .fuchsia: [
            .s50: "#fdf4ff", .s100: "#fae8ff", .s200: "#f5d0fe",
            .s300: "#f0abfc", .s400: "#e879f9", .s500: "#d946ef",
            .s600: "#c026d3", .s700: "#a21caf", .s800: "#86198f",
            .s900: "#701a75", .s950: "#4a044e"
        ],
        // Pink
        .pink: [
            .s50: "#fdf2f8", .s100: "#fce7f3", .s200: "#fbcfe8",
            .s300: "#f9a8d4", .s400: "#f472b6", .s500: "#ec4899",
            .s600: "#db2777", .s700: "#be185d", .s800: "#9d174d",
            .s900: "#831843", .s950: "#500724"
        ],
        // Rose
        .rose: [
            .s50: "#fff1f2", .s100: "#ffe4e6", .s200: "#fecdd3",
            .s300: "#fda4af", .s400: "#fb7185", .s500: "#f43f5e",
            .s600: "#e11d48", .s700: "#be123c", .s800: "#9f1239",
            .s900: "#881337", .s950: "#4c0519"
        ]
    ]
    
    // 获取对应的Color
    var color: Color {
        guard let hex = Self.colorHexValues[base]?[shade] else {
            return .clear
        }
        return Color(hex: hex)
    }
    
    // 便捷初始化方法
    init(_ base: BaseColor, _ shade: Shade = .s500) {
        self.base = base
        self.shade = shade
    }
}

// 扩展Color以支持HEX初始化
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// 扩展Color提供便捷访问Tailwind颜色的方法
extension Color {
    static func tailwind(_ base: TailwindColor.BaseColor, _ shade: TailwindColor.Shade = .s500) -> Color {
        TailwindColor(base, shade).color
    }
    
    // 预定义常用颜色
    // Slate
    static let slate50 = TailwindColor(.slate, .s50).color
    static let slate100 = TailwindColor(.slate, .s100).color
    static let slate200 = TailwindColor(.slate, .s200).color
    static let slate300 = TailwindColor(.slate, .s300).color
    static let slate400 = TailwindColor(.slate, .s400).color
    static let slate500 = TailwindColor(.slate, .s500).color
    static let slate600 = TailwindColor(.slate, .s600).color
    static let slate700 = TailwindColor(.slate, .s700).color
    static let slate800 = TailwindColor(.slate, .s800).color
    static let slate900 = TailwindColor(.slate, .s900).color
    static let slate950 = TailwindColor(.slate, .s950).color
    
    // Gray
    static let gray50 = TailwindColor(.gray, .s50).color
    static let gray100 = TailwindColor(.gray, .s100).color
    static let gray200 = TailwindColor(.gray, .s200).color
    static let gray300 = TailwindColor(.gray, .s300).color
    static let gray400 = TailwindColor(.gray, .s400).color
    static let gray500 = TailwindColor(.gray, .s500).color
    static let gray600 = TailwindColor(.gray, .s600).color
    static let gray700 = TailwindColor(.gray, .s700).color
    static let gray800 = TailwindColor(.gray, .s800).color
    static let gray900 = TailwindColor(.gray, .s900).color
    static let gray950 = TailwindColor(.gray, .s950).color
    
    // Zinc
    static let zinc50 = TailwindColor(.zinc, .s50).color
    static let zinc100 = TailwindColor(.zinc, .s100).color
    static let zinc200 = TailwindColor(.zinc, .s200).color
    static let zinc300 = TailwindColor(.zinc, .s300).color
    static let zinc400 = TailwindColor(.zinc, .s400).color
    static let zinc500 = TailwindColor(.zinc, .s500).color
    static let zinc600 = TailwindColor(.zinc, .s600).color
    static let zinc700 = TailwindColor(.zinc, .s700).color
    static let zinc800 = TailwindColor(.zinc, .s800).color
    static let zinc900 = TailwindColor(.zinc, .s900).color
    static let zinc950 = TailwindColor(.zinc, .s950).color
    
    // Neutral
    static let neutral50 = TailwindColor(.neutral, .s50).color
    static let neutral100 = TailwindColor(.neutral, .s100).color
    static let neutral200 = TailwindColor(.neutral, .s200).color
    static let neutral300 = TailwindColor(.neutral, .s300).color
    static let neutral400 = TailwindColor(.neutral, .s400).color
    static let neutral500 = TailwindColor(.neutral, .s500).color
    static let neutral600 = TailwindColor(.neutral, .s600).color
    static let neutral700 = TailwindColor(.neutral, .s700).color
    static let neutral800 = TailwindColor(.neutral, .s800).color
    static let neutral900 = TailwindColor(.neutral, .s900).color
    static let neutral950 = TailwindColor(.neutral, .s950).color
    
    // Stone
    static let stone50 = TailwindColor(.stone, .s50).color
    static let stone100 = TailwindColor(.stone, .s100).color
    static let stone200 = TailwindColor(.stone, .s200).color
    static let stone300 = TailwindColor(.stone, .s300).color
    static let stone400 = TailwindColor(.stone, .s400).color
    static let stone500 = TailwindColor(.stone, .s500).color
    static let stone600 = TailwindColor(.stone, .s600).color
    static let stone700 = TailwindColor(.stone, .s700).color
    static let stone800 = TailwindColor(.stone, .s800).color
    static let stone900 = TailwindColor(.stone, .s900).color
    static let stone950 = TailwindColor(.stone, .s950).color
    
    // Red
    static let red50 = TailwindColor(.red, .s50).color
    static let red100 = TailwindColor(.red, .s100).color
    static let red200 = TailwindColor(.red, .s200).color
    static let red300 = TailwindColor(.red, .s300).color
    static let red400 = TailwindColor(.red, .s400).color
    static let red500 = TailwindColor(.red, .s500).color
    static let red600 = TailwindColor(.red, .s600).color
    static let red700 = TailwindColor(.red, .s700).color
    static let red800 = TailwindColor(.red, .s800).color
    static let red900 = TailwindColor(.red, .s900).color
    static let red950 = TailwindColor(.red, .s950).color
    
    // Orange
    static let orange50 = TailwindColor(.orange, .s50).color
    static let orange100 = TailwindColor(.orange, .s100).color
    static let orange200 = TailwindColor(.orange, .s200).color
    static let orange300 = TailwindColor(.orange, .s300).color
    static let orange400 = TailwindColor(.orange, .s400).color
    static let orange500 = TailwindColor(.orange, .s500).color
    static let orange600 = TailwindColor(.orange, .s600).color
    static let orange700 = TailwindColor(.orange, .s700).color
    static let orange800 = TailwindColor(.orange, .s800).color
    static let orange900 = TailwindColor(.orange, .s900).color
    static let orange950 = TailwindColor(.orange, .s950).color
    
    // Amber
    static let amber50 = TailwindColor(.amber, .s50).color
    static let amber100 = TailwindColor(.amber, .s100).color
    static let amber200 = TailwindColor(.amber, .s200).color
    static let amber300 = TailwindColor(.amber, .s300).color
    static let amber400 = TailwindColor(.amber, .s400).color
    static let amber500 = TailwindColor(.amber, .s500).color
    static let amber600 = TailwindColor(.amber, .s600).color
    static let amber700 = TailwindColor(.amber, .s700).color
    static let amber800 = TailwindColor(.amber, .s800).color
    static let amber900 = TailwindColor(.amber, .s900).color
    static let amber950 = TailwindColor(.amber, .s950).color
    
    // Yellow
    static let yellow50 = TailwindColor(.yellow, .s50).color
    static let yellow100 = TailwindColor(.yellow, .s100).color
    static let yellow200 = TailwindColor(.yellow, .s200).color
    static let yellow300 = TailwindColor(.yellow, .s300).color
    static let yellow400 = TailwindColor(.yellow, .s400).color
    static let yellow500 = TailwindColor(.yellow, .s500).color
    static let yellow600 = TailwindColor(.yellow, .s600).color
    static let yellow700 = TailwindColor(.yellow, .s700).color
    static let yellow800 = TailwindColor(.yellow, .s800).color
    static let yellow900 = TailwindColor(.yellow, .s900).color
    static let yellow950 = TailwindColor(.yellow, .s950).color
    
    // Lime
    static let lime50 = TailwindColor(.lime, .s50).color
    static let lime100 = TailwindColor(.lime, .s100).color
    static let lime200 = TailwindColor(.lime, .s200).color
    static let lime300 = TailwindColor(.lime, .s300).color
    static let lime400 = TailwindColor(.lime, .s400).color
    static let lime500 = TailwindColor(.lime, .s500).color
    static let lime600 = TailwindColor(.lime, .s600).color
    static let lime700 = TailwindColor(.lime, .s700).color
    static let lime800 = TailwindColor(.lime, .s800).color
    static let lime900 = TailwindColor(.lime, .s900).color
    static let lime950 = TailwindColor(.lime, .s950).color
    
    // Green
    static let green50 = TailwindColor(.green, .s50).color
    static let green100 = TailwindColor(.green, .s100).color
    static let green200 = TailwindColor(.green, .s200).color
    static let green300 = TailwindColor(.green, .s300).color
    static let green400 = TailwindColor(.green, .s400).color
    static let green500 = TailwindColor(.green, .s500).color
    static let green600 = TailwindColor(.green, .s600).color
    static let green700 = TailwindColor(.green, .s700).color
    static let green800 = TailwindColor(.green, .s800).color
    static let green900 = TailwindColor(.green, .s900).color
    static let green950 = TailwindColor(.green, .s950).color
    
    // Emerald
    static let emerald50 = TailwindColor(.emerald, .s50).color
    static let emerald100 = TailwindColor(.emerald, .s100).color
    static let emerald200 = TailwindColor(.emerald, .s200).color
    static let emerald300 = TailwindColor(.emerald, .s300).color
    static let emerald400 = TailwindColor(.emerald, .s400).color
    static let emerald500 = TailwindColor(.emerald, .s500).color
    static let emerald600 = TailwindColor(.emerald, .s600).color
    static let emerald700 = TailwindColor(.emerald, .s700).color
    static let emerald800 = TailwindColor(.emerald, .s800).color
    static let emerald900 = TailwindColor(.emerald, .s900).color
    static let emerald950 = TailwindColor(.emerald, .s950).color
    
    // Teal
    static let teal50 = TailwindColor(.teal, .s50).color
    static let teal100 = TailwindColor(.teal, .s100).color
    static let teal200 = TailwindColor(.teal, .s200).color
    static let teal300 = TailwindColor(.teal, .s300).color
    static let teal400 = TailwindColor(.teal, .s400).color
    static let teal500 = TailwindColor(.teal, .s500).color
    static let teal600 = TailwindColor(.teal, .s600).color
    static let teal700 = TailwindColor(.teal, .s700).color
    static let teal800 = TailwindColor(.teal, .s800).color
    static let teal900 = TailwindColor(.teal, .s900).color
    static let teal950 = TailwindColor(.teal, .s950).color
    
    // Cyan
    static let cyan50 = TailwindColor(.cyan, .s50).color
    static let cyan100 = TailwindColor(.cyan, .s100).color
    static let cyan200 = TailwindColor(.cyan, .s200).color
    static let cyan300 = TailwindColor(.cyan, .s300).color
    static let cyan400 = TailwindColor(.cyan, .s400).color
    static let cyan500 = TailwindColor(.cyan, .s500).color
    static let cyan600 = TailwindColor(.cyan, .s600).color
    static let cyan700 = TailwindColor(.cyan, .s700).color
    static let cyan800 = TailwindColor(.cyan, .s800).color
    static let cyan900 = TailwindColor(.cyan, .s900).color
    static let cyan950 = TailwindColor(.cyan, .s950).color
    
    // Sky
    static let sky50 = TailwindColor(.sky, .s50).color
    static let sky100 = TailwindColor(.sky, .s100).color
    static let sky200 = TailwindColor(.sky, .s200).color
    static let sky300 = TailwindColor(.sky, .s300).color
    static let sky400 = TailwindColor(.sky, .s400).color
    static let sky500 = TailwindColor(.sky, .s500).color
    static let sky600 = TailwindColor(.sky, .s600).color
    static let sky700 = TailwindColor(.sky, .s700).color
    static let sky800 = TailwindColor(.sky, .s800).color
    static let sky900 = TailwindColor(.sky, .s900).color
    static let sky950 = TailwindColor(.sky, .s950).color
    
    // Blue
    static let blue50 = TailwindColor(.blue, .s50).color
    static let blue100 = TailwindColor(.blue, .s100).color
    static let blue200 = TailwindColor(.blue, .s200).color
    static let blue300 = TailwindColor(.blue, .s300).color
    static let blue400 = TailwindColor(.blue, .s400).color
    static let blue500 = TailwindColor(.blue, .s500).color
    static let blue600 = TailwindColor(.blue, .s600).color
    static let blue700 = TailwindColor(.blue, .s700).color
    static let blue800 = TailwindColor(.blue, .s800).color
    static let blue900 = TailwindColor(.blue, .s900).color
    static let blue950 = TailwindColor(.blue, .s950).color
    
    // Indigo
    static let indigo50 = TailwindColor(.indigo, .s50).color
    static let indigo100 = TailwindColor(.indigo, .s100).color
    static let indigo200 = TailwindColor(.indigo, .s200).color
    static let indigo300 = TailwindColor(.indigo, .s300).color
    static let indigo400 = TailwindColor(.indigo, .s400).color
    static let indigo500 = TailwindColor(.indigo, .s500).color
    static let indigo600 = TailwindColor(.indigo, .s600).color
    static let indigo700 = TailwindColor(.indigo, .s700).color
    static let indigo800 = TailwindColor(.indigo, .s800).color
    static let indigo900 = TailwindColor(.indigo, .s900).color
    static let indigo950 = TailwindColor(.indigo, .s950).color
    
    // Violet
    static let violet50 = TailwindColor(.violet, .s50).color
    static let violet100 = TailwindColor(.violet, .s100).color
    static let violet200 = TailwindColor(.violet, .s200).color
    static let violet300 = TailwindColor(.violet, .s300).color
    static let violet400 = TailwindColor(.violet, .s400).color
    static let violet500 = TailwindColor(.violet, .s500).color
    static let violet600 = TailwindColor(.violet, .s600).color
    static let violet700 = TailwindColor(.violet, .s700).color
    static let violet800 = TailwindColor(.violet, .s800).color
    static let violet900 = TailwindColor(.violet, .s900).color
    static let violet950 = TailwindColor(.violet, .s950).color
    
    // Purple
    static let purple50 = TailwindColor(.purple, .s50).color
    static let purple100 = TailwindColor(.purple, .s100).color
    static let purple200 = TailwindColor(.purple, .s200).color
    static let purple300 = TailwindColor(.purple, .s300).color
    static let purple400 = TailwindColor(.purple, .s400).color
    static let purple500 = TailwindColor(.purple, .s500).color
    static let purple600 = TailwindColor(.purple, .s600).color
    static let purple700 = TailwindColor(.purple, .s700).color
    static let purple800 = TailwindColor(.purple, .s800).color
    static let purple900 = TailwindColor(.purple, .s900).color
    static let purple950 = TailwindColor(.purple, .s950).color
    
    // Fuchsia
    static let fuchsia50 = TailwindColor(.fuchsia, .s50).color
    static let fuchsia100 = TailwindColor(.fuchsia, .s100).color
    static let fuchsia200 = TailwindColor(.fuchsia, .s200).color
    static let fuchsia300 = TailwindColor(.fuchsia, .s300).color
    static let fuchsia400 = TailwindColor(.fuchsia, .s400).color
    static let fuchsia500 = TailwindColor(.fuchsia, .s500).color
    static let fuchsia600 = TailwindColor(.fuchsia, .s600).color
    static let fuchsia700 = TailwindColor(.fuchsia, .s700).color
    static let fuchsia800 = TailwindColor(.fuchsia, .s800).color
    static let fuchsia900 = TailwindColor(.fuchsia, .s900).color
    static let fuchsia950 = TailwindColor(.fuchsia, .s950).color
    
    // Pink
    static let pink50 = TailwindColor(.pink, .s50).color
    static let pink100 = TailwindColor(.pink, .s100).color
    static let pink200 = TailwindColor(.pink, .s200).color
    static let pink300 = TailwindColor(.pink, .s300).color
    static let pink400 = TailwindColor(.pink, .s400).color
    static let pink500 = TailwindColor(.pink, .s500).color
    static let pink600 = TailwindColor(.pink, .s600).color
    static let pink700 = TailwindColor(.pink, .s700).color
    static let pink800 = TailwindColor(.pink, .s800).color
    static let pink900 = TailwindColor(.pink, .s900).color
    static let pink950 = TailwindColor(.pink, .s950).color
    
    // Rose
    static let rose50 = TailwindColor(.rose, .s50).color
    static let rose100 = TailwindColor(.rose, .s100).color
    static let rose200 = TailwindColor(.rose, .s200).color
    static let rose300 = TailwindColor(.rose, .s300).color
    static let rose400 = TailwindColor(.rose, .s400).color
    static let rose500 = TailwindColor(.rose, .s500).color
    static let rose600 = TailwindColor(.rose, .s600).color
    static let rose700 = TailwindColor(.rose, .s700).color
    static let rose800 = TailwindColor(.rose, .s800).color
    static let rose900 = TailwindColor(.rose, .s900).color
    static let rose950 = TailwindColor(.rose, .s950).color
    
    // 常用颜色快捷方式
    static let primary = blue500
    static let secondary = indigo500
    static let success = emerald500
    static let danger = red500
    static let warning = amber500
    static let info = sky500
    static let light = slate100
    static let dark = slate800
}

// 扩展View提供Tailwind风格的修饰符
extension View {
    func backgroundColor(_ base: TailwindColor.BaseColor, _ shade: TailwindColor.Shade = .s500) -> some View {
        self.background(TailwindColor(base, shade).color)
    }
    
    func foregroundColor(_ base: TailwindColor.BaseColor, _ shade: TailwindColor.Shade = .s500) -> some View {
        self.foregroundStyle(TailwindColor(base, shade).color)
    }
    
    func borderColor(_ base: TailwindColor.BaseColor, _ shade: TailwindColor.Shade = .s500, width: CGFloat = 1) -> some View {
        self.border(TailwindColor(base, shade).color, width: width)
    }
}
