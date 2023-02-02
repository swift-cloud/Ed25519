private let secureSeedLength = 32

public struct Seed: Sendable {
    public let bytes: [UInt8]

    public init(bytes: [UInt8]) throws {
        guard bytes.count == secureSeedLength else {
            throw Ed25519Error.invalidSeedLength
        }
        self.bytes = bytes
    }

    public init() {
        self.bytes = Array<UInt8>(unsafeUninitializedCapacity: secureSeedLength) { pointer, size in
            for i in 0 ..< pointer.count {
                pointer[i] = UInt8.random(in: .min ... .max)
            }
            size = pointer.count
        }
    }
}
