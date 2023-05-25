// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.
//
// forked and changed 5-25-23

import PackageDescription

let package = Package(
  name: "Supabase",
  platforms: [
    .iOS(.v13),
    .macCatalyst(.v13),
    .macOS(.v10_15),
    .watchOS(.v6),
    .tvOS(.v13),
  ],
  products: [
    .library(
      name: "Supabase",
      targets: ["Supabase"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/supabase-community/gotrue-swift", from: "1.0.0"),
    .package(url: "https://github.com/supabase-community/storage-swift.git", from: "0.1.1"),
    .package(url: "https://github.com/supabase-community/realtime-swift.git", from: "0.0.2"),
    .package(url: "https://github.com/supabase-community/postgrest-swift", from: "1.0.0"),
    .package(url: "https://github.com/supabase-community/functions-swift", from: "1.0.0"),
    .package(name: "Supabase", url: "https://github.com/supabase/supabase-swift.git", branch: "master"), // Add the package
  ],
  targets: [
    .target(
      name: "Supabase",
      dependencies: [
        .product(name: "GoTrue", package: "gotrue-swift"),
        .product(name: "SupabaseStorage", package: "storage-swift"),
        .product(name: "Realtime", package: "realtime-swift"),
        .product(name: "PostgREST", package: "postgrest-swift"),
        .product(name: "Functions", package: "functions-swift"),
      ]
    ),
    .target(
      name: "SabianSymbol",
      dependencies: ["Supabase"] // Add as a dependency
        ),
    .testTarget(name: "SupabaseTests", dependencies: ["Supabase"]),
  ]
)
