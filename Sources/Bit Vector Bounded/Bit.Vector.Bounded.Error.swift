import Carrier
public import Index
public import Ordinal
import Tagged

public enum __BitVectorBoundedError: Swift::Error, Sendable, Equatable {
    case bounds(index: Index<Bit>, count: Index<Bit>.Count)
    case invalidCount
    case overflow
}
