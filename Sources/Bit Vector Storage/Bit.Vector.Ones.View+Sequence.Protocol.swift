import Carrier
import Tagged
public import Iterator
import Sequence
public import Index
public import Ordinal

extension Bit.Vector.Ones.View: Iterable {

    public typealias Element = Index<Bit>

    @_implements(Iterable,Iterator)
    public typealias IterableIterator = BitVectorMaterializingIterator<ElementIterator>

    @inlinable
    @_lifetime(borrow self)
    @_implements(Iterable,makeIterator())
    public borrowing func iterableMakeIterator()
        -> BitVectorMaterializingIterator<ElementIterator>
    {
        BitVectorMaterializingIterator(ElementIterator(view: copy self))
    }

    @inlinable
    @_lifetime(copy self)
    public borrowing func makeIterator() -> ElementIterator {
        ElementIterator(view: copy self)
    }
}

extension Bit.Vector.Ones.View {

    @inline(always)
    @inlinable
    public func forEach(_ body: (Index<Bit>) -> Void) {
        var iterator: ElementIterator = makeIterator()
        while let element = iterator.next() {
            body(element)
        }
    }
}
