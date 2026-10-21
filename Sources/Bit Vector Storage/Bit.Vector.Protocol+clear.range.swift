public import Cardinal
import Carrier
public import Difference
public import Index
public import Ordinal
public import Ownership
public import Property
public import Tagged

extension Property.Inout where Tag == Bit.Vector.Clear, Base: _BitVectorProtocol & ~Copyable {

    @inlinable
    public mutating func range(_ range: Swift::Range<Index<Bit>>) {
        guard range.upperBound > range.lowerBound else { return }

        let startLoc = Bit.Pack<UInt>.Location(index: range.lowerBound, bitsPerWord: .bitsPerWord)

        let endIndex = {
            do {
                return try range.upperBound.predecessor.exact()
            } catch {
                preconditionFailure("A non-empty range has a predecessor of its upper bound: \(error)")
            }
        }()
        let endLoc = Bit.Pack<UInt>.Location(
            index: endIndex,
            bitsPerWord: .bitsPerWord
        )
        let startBit = Index<Bit>.Count(
            _unchecked: startLoc.bit.underlying.magnitude.value
        )
        let endBit = Index<Bit>.Count(
            _unchecked: endLoc.bit.underlying.magnitude.value
        )

        let startWord = Int(bitPattern: startLoc.word)
        let endWord = Int(bitPattern: endLoc.word)

        let lowMask: UInt = ~0 << startBit

        let maxBitIndex = {
            do {
                return try Bit.Pack<UInt>.bitWidth.subtract.exact(.one)
            } catch {
                preconditionFailure("A word has at least one bit: \(error)")
            }
        }()

        let highShift = {
            do {
                return try maxBitIndex.subtract.exact(endBit)
            } catch {
                preconditionFailure("The end bit does not exceed the highest bit index: \(error)")
            }
        }()
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
