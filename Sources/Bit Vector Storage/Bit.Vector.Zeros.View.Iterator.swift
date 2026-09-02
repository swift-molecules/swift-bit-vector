public import Cardinal_Carrier
public import Ordinal_Cardinal
public import Ordinal_Comparison
import Tagged_Carrier
import Cardinal
import Ordinal
import Tagged
public import Index
public import Ordinal_Protocol
public import Ordinal_Standard_Library_Integration
extension Bit.Vector.Zeros.View {

    @safe
    public struct ElementIterator: BitVectorElementIteratorProtocol, Copyable, ~Escapable {
        @usableFromInline
        let _words: UnsafeMutablePointer<UInt>

        @usableFromInline
        let _wordCount: Tagged<UInt, Cardinal>

        @usableFromInline
        let _capacity: Index<Bit>.Count

        @usableFromInline
        var _wordIndex: Tagged<UInt, Ordinal>

        @usableFromInline
        var _currentWord: UInt

        @inlinable
        @_lifetime(copy view)
        package init(view: Bit.Vector.Zeros.View) {
            unsafe self._words = view._words
            self._wordCount = view._wordCount
            self._capacity = view._capacity
            self._wordIndex = Tagged(_unchecked: Ordinal(UInt.zero))
            if view._wordCount.underlying.rawValue > 0 {
                unsafe self._currentWord = ~view._words[self._wordIndex]
            } else {
                self._currentWord = 0
            }
        }
    }
}

extension Bit.Vector.Zeros.View.ElementIterator {

    @inlinable
    public mutating func next() -> Index<Bit>? {

        while _currentWord == 0 {
            let (rawNext, overflow) =
                _wordIndex.underlying.rawValue.addingReportingOverflow(1)
            guard !overflow else { return nil }
            let next = Tagged<UInt, Ordinal>(_unchecked: Ordinal(rawNext))
            guard rawNext < _wordCount.underlying.rawValue else { return nil }
            _wordIndex = next
            unsafe _currentWord = ~_words[_wordIndex]
        }

        let bitPosition = _currentWord.trailingZeroBitCount
        _currentWord &= _currentWord &- 1

        let wordAsCount = Tagged<UInt, Cardinal>(
            _unchecked: Cardinal(_wordIndex.underlying)
        )
        let baseBitCount = wordAsCount * .bitsPerWord
        let globalIndex =
            baseBitCount.map(Ordinal.init)
                + Tagged<Bit, Cardinal>(
                    _unchecked: Cardinal(UInt(bitPosition))
                )

        guard globalIndex < _capacity else { return nil }
        return globalIndex
    }
}
