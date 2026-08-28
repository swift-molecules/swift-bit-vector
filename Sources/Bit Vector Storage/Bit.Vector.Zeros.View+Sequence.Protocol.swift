import Tagged_Carrier
public import Iterator
import Sequence

extension Bit.Vector.Zeros.View: Iterable {

    public typealias Element = Bit.Index

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

extension Bit.Vector.Zeros.View {

    @inline(always)
    @inlinable
    public func forEach(_ body: (Bit.Index) -> Void) {
        var iterator: ElementIterator = makeIterator()
        while let element = iterator.next() {
            body(element)
        }
    }
}
