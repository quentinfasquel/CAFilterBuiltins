# CAFilterBuiltins

`CAFilterBuiltins` is a Swift package that provides a convenient wrapper around Apple’s private `CAFilter` class through `_CAFilter`.  
It offers an API style similar to `CoreImage.CIFilterBuiltins`, making it easier to work with Core Animation filters in a type-safe, Swift-friendly way.

⚠️ **Note:** `CAFilter` is a private API. Use at your own risk, especially if you plan to ship to the App Store.  

---

## ✨ Features

- Swift wrapper `_CAFilter` around `CAFilter`
- API style inspired by `CoreImage.CIFilterBuiltins`
- Cleaner, more expressive syntax for working with Core Animation filters
- Planned support for an **exhaustive list of CAFilters**

---

## 📦 Installation

### Swift Package Manager
Add the following to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/<your-username>/CAFilterBuiltins.git", from: "0.1.0")
]
```

## 🚀 Usage

```
import CAFilterBuiltins

// Example: Create a blur filter
let blur = _CAFilter.gaussianBlur()
blur.inputRadius = 10

// Given a `layer: CALayer`
layer.setFilters([blur])
```
## 🔮 Roadmap
- [x] Transparent wrapper around `CAFilter` (`_CAFilter`)
- [x] Expose protocols for all known filters
- [ ] Add typed properties to protocols (currently supported: `gaussianBlur`, `variableBlur`)
- [ ] SwiftUI integration examples

## ⚠️ Disclaimer

This project uses private Apple APIs. It is intended for learning, experimentation, or internal tools.
Repositories or apps that depend on this may be rejected from the App Store. Use responsibly.

## 📜 License

This project is licensed under the [MIT License](LICENSE) © 2025 Quentin Fasquel.
