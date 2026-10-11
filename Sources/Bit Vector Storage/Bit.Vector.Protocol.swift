import Carrier
import Tagged
public import Index
public import Ordinal
extension Bit.Vector {

    public typealias `Protocol` = _BitVectorProtocol
}

public protocol _BitVectorProtocol: ~Copyable {

    var bitCapacity: Index<Bit>.Count { get }

    borrowing func word(at index: Int) -> UInt

    mutating func setWord(at index: Int, to value: UInt)

    subscript(index: Index<Bit>) -> Bool { get set }
}
