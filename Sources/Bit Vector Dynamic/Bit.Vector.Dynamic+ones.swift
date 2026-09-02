import Tagged_Carrier
import Ownership
import Property
import Property_Ownership
public import Index
public import Cardinal_Standard_Library_Integration
public import Ordinal_Protocol
public import Ownership_Inout

extension Bit.Vector.Dynamic {

    @inlinable
    public var ones: Property<Bit.Vector.Ones, Self>.Inout {
        mutating _read {
            yield Property<Bit.Vector.Ones, Self>.Inout(&self)
        }
    }
}

extension Property.Inout where Tag == Bit.Vector.Ones, Base == Bit.Vector.Dynamic {

    @inlinable
    public func forEach(_ body: (Index<Bit>) -> Void) {
        let storage = base.value._storage
        let count = base.value._count
        let countInt = Int(clamping: count)
        let bitsPerWord = UInt.bitWidth

        for (wordIndex, var word) in storage.enumerated() {
            while word != 0 {
                let bitIndex = word.trailingZeroBitCount
                let globalIndex = wordIndex * bitsPerWord + bitIndex
                if globalIndex < countInt {
                    body(Index<Bit>(_unchecked: Ordinal(UInt(globalIndex))))
                }
                word &= word &- 1
            }
        }
    }
}
