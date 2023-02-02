import CEd25519

public struct Seed: Sendable {
    private let buffer: [UInt8]

    init(unchecked bytes: [UInt8]) {
        self.buffer = bytes
    }
    
    public init(bytes: [UInt8]) throws {
        guard bytes.count == 32 else {
            throw Ed25519Error.invalidSeedLength
        }
        
        buffer = bytes
    }

    public init() throws {
        let buffer = [UInt8](repeating: 0, count: 32).map { _ in
            return UInt8.random(in: 0..<UInt8.max)
        }
        
        self.init(unchecked: buffer)
    }

    public var bytes: [UInt8] {
        return buffer
    }
}
