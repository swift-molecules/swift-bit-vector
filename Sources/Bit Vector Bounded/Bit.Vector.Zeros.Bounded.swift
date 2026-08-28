import Tagged_Carrier
public import Iterator
import Sequence

extension Bit.Vector.Zeros {

    @safe
    public struct Bounded: Copyable, Sendable {
        @usableFromInline
        let _storage: ContiguousArray<UInt>

        @usableFromInline
        let _capacity: Bit.Index.Count

        @inlinable
        package init(storage: ContiguousArray<UInt>, capacity: Bit.Index.Count) {
            self._storage = storage
            self._capacity = capacity
        }
    }
}

extension Bit.Vector.Zeros.Bounded {

    @inlinable
    public func first(max: Bit.Index.Count) -> Bit.Index? {
        for i in 0..<_storage.count {
            let inverted = ~_storage[i]
            if inverted != 0 {
                let location = Bit.Pack<UInt>.Location(
                    word: .init(Ordinal(UInt(i))),
                    bit: .init(Affine.Discrete.Vector(inverted.trailingZeroBitCount))
                )
                let globalIndex = location.index(bitsPerWord: .bitsPerWord)
                guard globalIndex < max else { return nil }
                return globalIndex
            }
        }
        return nil
    }
}

extension Bit.Vector.Zeros.Bounded: Iterable {

    public typealias Element = Bit.Index

    @_implements(Iterable,Iterator)
    public typealias IterableIterator = BitVectorMaterializingIterator<ElementIterator>

    @inlinable
    @_lifetime(borrow self)
    @_implements(Iterable,makeIterator())
    public borrowing func iterableMakeIterator()
        -> BitVectorMaterializingIterator<ElementIterator>
    {
        BitVectorMaterializingIterator(ElementIterator(storage: _storage, capacity: _capacity))
    }

    @inlinable
    public func makeIterator() -> ElementIterator {
        ElementIterator(storage: _storage, capacity: _capacity)
    }
}

extension Bit.Vector.Zeros.Bounded: Swift.Sequence {}
