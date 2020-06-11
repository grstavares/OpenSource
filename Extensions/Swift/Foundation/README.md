# FoundationExtensions

[![Build Status](https://github.com/swift-extensions/foundation-extensions/workflows/ci/badge.svg)](https://github.com/swift-extensions/foundation-extensions/actions)

## Property Wrappers

### Constrained
Clamps value to a range
```swift
@Constrained(0...14) var pH: Int
```

### UnitInterval
Clamps value to a range from 0 to 1
```swift
@UnitInterval var volume: Double
```

### Formatted
Formats a value with closure
```swift
@Formatted({ $0 + 1 }) var increment: Int
```

### Trimmed
Trims whitespace and new lines from string
```swift
@Trimmed var string: String
```

### Uppercased
Forcing uppercased string
```swift
@Uppercased var name: String
```

### Lowercased
Forcing lowercased string
```swift
@Lowercased var name: String
```

### Capitalized
Formats a string to be capitalized
```swift
@Capitalized var name: String
```
