import Carrier
import Tagged
public import Index
public import Ordinal
extension Bit.Vector.Static {

    @inlinable
    public mutating func toggle(_ index: Index<Bit>) {
        precondition(index < Self.capacity, "Index out of bounds")
        let location = Bit.Pack<UInt>.Location(index: index, bitsPerWord: .bitsPerWord)
        _storage[location.word] ^= location.mask
    }
}
