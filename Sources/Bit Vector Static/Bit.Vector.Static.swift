import Carrier
import Tagged
public import Bit
public import Index
import Cardinal
public import Ordinal
extension Bit.Vector {

    public struct Static<let wordCount: Int>: Sendable {
        @usableFromInline
        package var _storage: InlineArray<wordCount, UInt>

        @inlinable
        public static var capacity: Index<Bit>.Count {
            Tagged<Bit, Cardinal>(
                _unchecked: Cardinal(UInt(wordCount * UInt.bitWidth))
            )
        }

        @inlinable
        public init() {
            self._storage = InlineArray(repeating: 0)
        }
    }
}

extension Bit.Vector.Static {

    @inlinable
    public subscript(index: Index<Bit>) -> Bool {
        get {
            let location = Bit.Pack<UInt>.Location(index: index, bitsPerWord: .bitsPerWord)
            return (_storage[location.word] & location.mask) != 0
        }
        set {
            let location = Bit.Pack<UInt>.Location(index: index, bitsPerWord: .bitsPerWord)
            if newValue {
                _storage[location.word] |= location.mask
            } else {
                _storage[location.word] &= ~location.mask
            }
        }
    }
}

extension Bit.Vector.Static {

    @inlinable
    public var isEmpty: Bool { allFalse }

    @inlinable
    public var isFull: Bool { allTrue }
}
