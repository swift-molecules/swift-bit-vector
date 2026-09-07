import Tagged_Carrier
public import Cardinal_Tagged
public import Ordinal_Comparison
public import Ordinal_Predecessor
public import Ordinal_Tagged
import Property
import Property_Ownership
public import Index
public import Cardinal_Standard_Library_Integration
public import Ordinal_Standard_Library_Integration
public import Ownership
public import Ordinal_Protocol
extension Property.Inout where Tag == Bit.Vector.Clear, Base: Bit.Vector.`Protocol` & ~Copyable {

    @inlinable
    public mutating func range(_ range: Swift.Range<Index<Bit>>) {
        guard range.upperBound > range.lowerBound else { return }

        let startLoc = Bit.Pack<UInt>.Location(index: range.lowerBound, bitsPerWord: .bitsPerWord)

        let endIndex = try! range.upperBound.predecessor.exact()
        let endLoc = Bit.Pack<UInt>.Location(
            index: endIndex,
            bitsPerWord: .bitsPerWord
        )
        let startBit = startLoc.bit.magnitude
        let endBit = endLoc.bit.magnitude

        let startWord = Int(bitPattern: startLoc.word)
        let endWord = Int(bitPattern: endLoc.word)

        let lowMask: UInt = ~0 << startBit

        let maxBitIndex = try! Bit.Pack<UInt>.bitWidth.subtract.exact(.one)

        let highShift = try! maxBitIndex.subtract.exact(endBit)
        let highMask: UInt = ~0 >> highShift

        if startWord == endWord {
            let current = base.value.word(at: startWord)
            base.value.setWord(at: startWord, to: current & ~(lowMask & highMask))
        } else {
            let startCurrent = base.value.word(at: startWord)
            base.value.setWord(at: startWord, to: startCurrent & ~lowMask)
            var w = startWord + 1
            while w < endWord {
                base.value.setWord(at: w, to: 0)
                w += 1
            }
            let endCurrent = base.value.word(at: endWord)
            base.value.setWord(at: endWord, to: endCurrent & ~highMask)
        }
    }
}
