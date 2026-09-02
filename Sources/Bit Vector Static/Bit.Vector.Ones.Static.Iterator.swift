import Tagged_Carrier
import Cardinal
import Ordinal
import Tagged
public import Index
public import Ordinal_Protocol
extension Bit.Vector.Ones.Static {

    @safe
    public struct ElementIterator: BitVectorElementIteratorProtocol, IteratorProtocol {
        @usableFromInline
        let _storage: InlineArray<wordCount, UInt>

        @usableFromInline
        var _wordIndex: Int

        @usableFromInline
        var _currentWord: UInt

        @inlinable
        package init(storage: InlineArray<wordCount, UInt>) {
            self._storage = storage
            self._wordIndex = 0
            if wordCount > 0 {
                self._currentWord = storage[0]
            } else {
                self._currentWord = 0
            }
        }
    }
}

extension Bit.Vector.Ones.Static.ElementIterator {

    @inlinable
    public mutating func next() -> Index<Bit>? {

        while _currentWord == 0 {
            _wordIndex += 1
            guard _wordIndex < wordCount else { return nil }
            _currentWord = _storage[_wordIndex]
        }

        let bitPosition = _currentWord.trailingZeroBitCount
        _currentWord &= _currentWord &- 1

        let wordCount = Tagged<UInt, Cardinal>(
            _unchecked: Cardinal(UInt(_wordIndex))
        )
        let baseBitCount = wordCount * .bitsPerWord
        return baseBitCount.map(Ordinal.init)
            + Tagged<Bit, Cardinal>(
                _unchecked: Cardinal(UInt(bitPosition))
            )
    }
}
