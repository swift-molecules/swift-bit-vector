import Carrier
import Tagged
public import Ordinal_Tagged
import Cardinal
import Ordinal
import Difference
public import Index
public import Ordinal
public import Cardinal
extension Bit.Vector.Inline {

    @inlinable
    public mutating func set(_ index: Index<Bit>) throws(Self.Error) {
        guard index < _count else {
            throw .bounds(index: index, count: _count)
        }
        let loc = index.location(bitsPerWord: .bitsPerWord)
        _storage[loc.word] |= loc.mask
    }

    @inlinable
    public mutating func clear(_ index: Index<Bit>) throws(Self.Error) {
        guard index < _count else {
            throw .bounds(index: index, count: _count)
        }
        let loc = index.location(bitsPerWord: .bitsPerWord)
        _storage[loc.word] &= ~loc.mask
    }

    @inlinable
    public mutating func toggle(_ index: Index<Bit>) throws(Self.Error) {
        guard index < _count else {
            throw .bounds(index: index, count: _count)
        }
        let loc = index.location(bitsPerWord: .bitsPerWord)
        _storage[loc.word] ^= loc.mask
    }

    @inlinable
    public mutating func setAll() {
        let pack = Bit.Pack<UInt>(count: _count, bitsPerWord: .bitsPerWord)
        let end = pack.words.count.map(Ordinal.init)
        var w: Tagged<UInt, Ordinal> = .zero
        while w < end {
            _storage[w] = ~0
            w += Tagged<UInt, Cardinal>.one
        }
        if pack.bits.unused > .zero && pack.words.count > .zero {

            let lastWord = try! end.predecessor.exact()
            let mask: UInt = ~0 >> pack.bits.unused
            _storage[lastWord] = mask
        }
    }
}
