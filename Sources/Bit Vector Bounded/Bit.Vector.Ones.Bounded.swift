import Tagged_Carrier
public import Iterator
import Sequence

extension Bit.Vector.Ones {

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

extension Bit.Vector.Ones.Bounded: Iterable {

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

extension Bit.Vector.Ones.Bounded: Swift.Sequence {}
