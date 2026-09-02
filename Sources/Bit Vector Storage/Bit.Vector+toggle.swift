import Tagged_Carrier
public import Index
public import Ordinal_Protocol
public import Ordinal_Standard_Library_Integration
extension Bit.Vector {

    @inlinable
    public nonmutating func toggle(_ index: Index<Bit>) {
        precondition(index < capacity, "Index out of bounds")
        let location = Bit.Pack<UInt>.Location(index: index, bitsPerWord: .bitsPerWord)
        let current = unsafe _words[location.word]
        unsafe _words[location.word] = current ^ location.mask
    }
}
