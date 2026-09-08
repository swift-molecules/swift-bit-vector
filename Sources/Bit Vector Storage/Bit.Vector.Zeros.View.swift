public import Index
public import Ordinal
import Carrier
import Tagged
import Cardinal
import Ordinal

extension Bit.Vector.Zeros {

    @safe

    public struct View: Copyable, ~Escapable {
        @usableFromInline
        let _words: UnsafeMutablePointer<UInt>

        @usableFromInline
        let _wordCount: Tagged<UInt, Cardinal>

        @usableFromInline
        let _capacity: Index<Bit>.Count

        @inlinable
        @_lifetime(borrow vector)
        package init(vector: borrowing Bit.Vector) {
            unsafe self._words = vector._words
            self._wordCount = vector._wordCount
            self._capacity = vector.capacity
        }
    }
}
