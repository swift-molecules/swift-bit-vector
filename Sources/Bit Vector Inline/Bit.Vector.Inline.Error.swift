import Carrier
import Tagged
public import Index
public import Ordinal
public enum __BitVectorInlineError: Swift.Error, Sendable, Equatable {
    case bounds(index: Index<Bit>, count: Index<Bit>.Count)
    case overflow
}
