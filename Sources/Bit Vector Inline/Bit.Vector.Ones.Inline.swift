import Tagged_Carrier
public import Iterator
import Sequence
public import Index
public import Iterable
public import Ordinal_Protocol
extension Bit.Vector.Ones {

    @safe
    public struct Inline<let wordCount: Int>: Copyable, Sendable {
        @usableFromInline
        let _storage: InlineArray<wordCount, UInt>

        @usableFromInline
        let _capacity: Index<Bit>.Count

        @inlinable
        package init(storage: InlineArray<wordCount, UInt>, capacity: Index<Bit>.Count) {
            self._storage = storage
            self._capacity = capacity
        }
    }
}

extension Bit.Vector.Ones.Inline: Iterable {

    public typealias Element = Index<Bit>

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

extension Bit.Vector.Ones.Inline: Swift.Sequence {}
