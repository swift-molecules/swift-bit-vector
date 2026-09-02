import Tagged_Carrier
public import Index
public import Ordinal_Protocol
public enum __BitVectorDynamicError: Swift.Error, Sendable, Equatable {
    case bounds(index: Index<Bit>, count: Index<Bit>.Count)
    case invalidCount
}
