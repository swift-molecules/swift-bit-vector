import Carrier
public import Index
public import Ordinal
import Tagged

public enum __BitVectorInlineError: Swift::Error, Sendable, Equatable {
    case bounds(index: Index<Bit>, count: Index<Bit>.Count)
    case overflow
}
