# GraphViz

![CI][ci badge]
[![Documentation][documentation badge]][documentation]

A Swift package for working with [GraphViz][graphviz] on macOS, iOS, and iOS Simulator.

## Requirements

- Swift 5.2+
- graphvizFramework from https://github.com/pusateri/GraphvizFrameworkPkg

## Usage

```swift
import GraphViz

var graph = Graph(directed: true)

let a = Node("a")
graph.append(a)
let b = Node("b")
graph.append(b)
let c = Node("c")
graph.append(c)

graph.append(Edge(from: a, to: b))
graph.append(Edge(from: a, to: c))

var b_c = Edge(from: b, to: c)
b_c.constraint = false
graph.append(b_c)

// Render image to SVG using dot layout algorithm
graph.render(using: .dot, to: .svg) { result in
    guard case .success(let data) = result else { return } 
    if let svg = String(data: data, encoding: .utf8) {
        print(svg)
    }
}
```

<img src="https://user-images.githubusercontent.com/7659/76256368-108d1600-620d-11ea-9263-d3ca3cc68d8d.png" alt="Example GraphViz Output" width="150" align="right">

```dot
digraph {
  a -> b
  a -> c
  b -> c [constraint=false]
}
```

> **Note**:
> `render(using:to:)` and related methods require
> GraphViz to be installed on your system.

### Using Function Builders, Custom Operators, and Fluent Attribute Setters

```swift
import GraphViz

let graph = Graph(directed: true) {
    "a" --> "b"
    "a" --> "c"
    ("b" --> "c").constraint(false)
}
```

## Installation

### System Dependencies

This package has been reworked to include a Graphviz framework for macOS, iOS, and iOS Simulator.
It will not look at graphiz libraries on your machine.
The Graphviz framework is version 7.0.6 and is packaged as a Swift Package.

Add both of these swift packages to your project and the cgraph library will work on these platforms.
It does not contain the neato_layout yet, just dot.

You no longer have to sign anything.

https://github.com/pusateri/GraphViz
https://github.com/pusateri/GraphvizFrameworkPkg


## License

MIT

## Contact

Mattt ([@mattt](https://twitter.com/mattt))

[graphviz]: https://graphviz.org
[ci badge]: https://github.com/SwiftDocOrg/GraphViz/workflows/CI/badge.svg
[documentation badge]: https://github.com/SwiftDocOrg/GraphViz/workflows/Documentation/badge.svg
[documentation]: https://github.com/SwiftDocOrg/GraphViz/wiki
