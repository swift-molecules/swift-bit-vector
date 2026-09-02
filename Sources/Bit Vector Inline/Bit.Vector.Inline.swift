import Tagged_Carrier
public import Cardinal_Tagged
public import Cardinal_Hash
public import Ordinal_Tagged
import Affine
import Cardinal
import Tagged
public import Index
public import Cardinal_Standard_Library_Integration
public import Ordinal_Predecessor
public import Ordinal_Protocol
public import Ordinal_Standard_Library_Integration
extension Bit.Vector {

    public struct Inline<let wordCount: Int>: Sendable {

        @inlinable
        public static var _capacity: Index<Bit>.Count {
            Tagged<Bit, Cardinal>(
                _unchecked: Cardinal(UInt(wordCount * UInt.bitWidth))
            )
        }

        @usableFromInline
        package var _storage: InlineArray<wordCount, UInt>

        @usableFromInline
        package var _count: Index<Bit>.Count

        @inlinable
        public init() {
            self._storage = InlineArray(repeating: 0)
            self._count = .zero
        }

        @inlinable
        public init(count: Index<Bit>.Count) throws(Self.Error) {
            guard count <= Self._capacity else {
                throw .overflow
            }
            self._storage = InlineArray(repeating: 0)
            self._count = count
        }

        @inlinable
        public init(repeating value: Bool, count: Index<Bit>.Count) throws(Self.Error) {
            guard count <= Self._capacity else {
                throw .overflow
            }
            self._storage = InlineArray(repeating: value ? ~0 : 0)
            self._count = count

            if value && count > .zero {
                let pack = Bit.Pack<UInt>(count: count, bitsPerWord: .bitsPerWord)
                if pack.bits.unused > .zero {

                    let lastWordIndex = try! pack.words.count.map(Ordinal.init).predecessor.exact()
                    let mask: UInt = ~0 >> pack.bits.unused
                    _storage[lastWordIndex] = mask
                }

                let countWords = Int(bitPattern: pack.words.count)
                for i in countWords..<wordCount {
                    _storage[i] = 0
                }
            }
        }

        public typealias Error = __BitVectorInlineError
    }
}

extension Bit.Vector.Inline {

    @inlinable
    public var count: Index<Bit>.Count { _count }

    @inlinable
    public var isEmpty: Bool { _count == .zero }

    @inlinable
    public var isFull: Bool { _count >= Self._capacity }

    @inlinable
    public var first: Bool? {
        guard _count > .zero else { return nil }
        return (_storage[0] & 1) != 0
    }

    @inlinable
    public var last: Bool? {
        guard _count > .zero else { return nil }
        let lastIndex = _count.subtract.saturating(.one)
        let loc = Bit.Pack<UInt>.Location(count: lastIndex, bitsPerWord: .bitsPerWord)
        return (_storage[loc.word] & loc.mask) != 0
    }
}

extension Bit.Vector.Inline {

    @inlinable
    public subscript(index: Index<Bit>) -> Bool {
        get {
            precondition(index < _count, "Index out of bounds")
            let loc = index.location(bitsPerWord: .bitsPerWord)
            return (_storage[loc.word] & loc.mask) != 0
        }
        set {
            precondition(index < _count, "Index out of bounds")
            let loc = index.location(bitsPerWord: .bitsPerWord)
            if newValue {
                _storage[loc.word] |= loc.mask
            } else {
                _storage[loc.word] &= ~loc.mask
            }
        }
    }

    @inlinable
    public func get(_ index: Index<Bit>) throws(Self.Error) -> Bool {
        guard index < _count else {
            throw .bounds(index: index, count: _count)
        }
        let loc = index.location(bitsPerWord: .bitsPerWord)
        return (_storage[loc.word] & loc.mask) != 0
    }
}
