import Tagged_Carrier
import Cardinal
import Ordinal
import Tagged

extension Bit.Vector.Ones {

    @safe

    public struct View: Copyable, ~Escapable {
        @usableFromInline
        let _words: UnsafeMutablePointer<UInt>

        @usableFromInline
        let _wordCount: Tagged<UInt, Cardinal>

        @usableFromInline
        let _capacity: Bit.Index.Count

        @inlinable
        @_lifetime(borrow vector)
        package init(vector: borrowing Bit.Vector) {
            unsafe self._words = vector._words
            self._wordCount = vector._wordCount
            self._capacity = vector.capacity
        }
    }
}
