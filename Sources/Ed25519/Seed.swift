private let secureSeedLength = 32

public struct Seed: Sendable {
    public let bytes: [UInt8]

    public init(bytes: [UInt8]) throws {
        guard bytes.count == secureSeedLength else {
            throw Ed25519Error.invalidSeedLength
        }
        self.bytes = bytes
    }

    public init() throws {
        let bytes = Array(repeating: 0, count: secureSeedLength).map { _ in
            return UInt8.random(in: UInt8.min ... UInt8.max)
        }
        try self.init(bytes: bytes)
    }
}
