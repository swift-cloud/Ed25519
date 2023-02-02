public enum Ed25519Error: Error, Sendable {
    case seedGenerationFailed
    case invalidSeedLength
    case invalidScalarLength
    case invalidPublicKeyLength
    case invalidPrivateKeyLength
    case invalidSignatureLength
}
