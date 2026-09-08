import Tagged_Carrier
import Cardinal
import Ordinal
import Tagged
public import Index
public import Ordinal
extension Bit.Vector.Ones.Bounded {

    @safe
    public struct ElementIterator: BitVectorElementIteratorProtocol, IteratorProtocol {
        @usableFromInline
        let _storage: ContiguousArray<UInt>

        @usableFromInline
        let _capacity: Index<Bit>.Count

        @usableFromInline
        var _wordIndex: Int

        @usableFromInline
        var _currentWord: UInt

        @inlinable
        package init(storage: ContiguousArray<UInt>, capacity: Index<Bit>.Count) {
            self._storage = storage
            self._capacity = capacity
            self._wordIndex = 0
            if !storage.isEmpty {
                self._currentWord = storage[0]
            } else {
                self._currentWord = 0
            }
        }
    }
}

extension Bit.Vector.Ones.Bounded.ElementIterator {

    @inlinable
    public mutating func next() -> Index<Bit>? {

        while _currentWord == 0 {
            _wordIndex += 1
            guard _wordIndex < _storage.count else { return nil }
            _currentWord = _storage[_wordIndex]
        }

        let bitPosition = _currentWord.trailingZeroBitCount
        _currentWord &= _currentWord &- 1

        let wordCount = Tagged<UInt, Cardinal>(
            _unchecked: Cardinal(UInt(_wordIndex))
        )
        let baseBitCount = wordCount * .bitsPerWord
        let globalIndex =
            baseBitCount.map(Ordinal.init)
                + Tagged<Bit, Cardinal>(
                    _unchecked: Cardinal(UInt(bitPosition))
                )

        guard globalIndex < _capacity else { return nil }
        return globalIndex
    }
}
