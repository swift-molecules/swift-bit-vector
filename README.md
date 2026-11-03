# swift-bit-vector

Use this package when you need a sequence of bits addressed by position, packed one bit per position into machine words. Pick the variant by how its length is known. When every position up to a fixed capacity is live, use `Bit.Vector` (heap-allocated, `~Copyable`, capacity chosen at run time) or `Bit.Vector.Static<wordCount>` (inline, copyable, capacity fixed at compile time). When the vector has a length that grows and shrinks, use `Bit.Vector.Dynamic` (unbounded), `Bit.Vector.Bounded` (capacity chosen at run time) or `Bit.Vector.Inline<wordCount>` (inline, capacity fixed at compile time). Code that works on any of these at the word level goes through `Bit.Vector.Protocol`. For a set of small integers with insert, remove and membership, use swift-bitset. For the bits of one fixed-width integer, use swift-bit-pattern.

## Laws

- Position `i` is bit `i % UInt.bitWidth` of word `i / UInt.bitWidth`, least significant bit first. `word(at:)`, `withUnsafeWords` and `withUnsafeMutableWords` expose this layout.
- The fixed-capacity variants and the variants with a length mean different things by `isEmpty` and `isFull`. For `Bit.Vector` and `Bit.Vector.Static<wordCount>`, `isEmpty` means no bit is set and `isFull` means every bit is set. For `Bit.Vector.Dynamic`, `Bit.Vector.Bounded` and `Bit.Vector.Inline<wordCount>`, `isEmpty` means the count is zero and `isFull` means the count has reached capacity.
- `Bit.Vector.Static<wordCount>.capacity` and the maximum capacity of `Bit.Vector.Inline<wordCount>` are `wordCount * UInt.bitWidth`.
- `Bit.Vector` writes through its subscript and `toggle(_:)` without `mutating`, so a `let` binding can be written, and every borrow sees the change.
- The subscript traps on an index at or past the capacity (`Bit.Vector`) or the count (the variants with a length). The throwing `get`, `set`, `clear` and `toggle` methods throw for that same index instead of trapping. `append` on `Bit.Vector.Bounded` and `Bit.Vector.Inline<wordCount>` throws once the count reaches capacity, and their initialisers throw when the requested count is above capacity. `Bit.Vector.Dynamic.append` never fails.
- In the variants with a length, `popLast`, `removeLast` and `removeAll` clear the bits they give up, so positions at or past the count read as zero.
- On `Bit.Vector.Dynamic`, `set.returning(_:)` and `clear.returning(_:)` return the bit's value from before the write. `toggle.returning(_:)` returns the value after the write.
- `set.range(_:)` and `clear.range(_:)` write the half-open range and leave every other bit alone. An empty range does nothing.
- `resize(to:fill:)` keeps the bits below the smaller of the old and new count. `fill` applies only to the positions it adds, and shrinking drops the positions past the new count.
- `ones` and `zeros` yield indices in ascending order. Iterating a variant with a length yields one `Bool` per position, from index zero up to the count. For `Bit.Vector` and `Bit.Vector.Static<wordCount>`, `ones` and `zeros` cover every position below capacity. For `Bit.Vector.Dynamic` and `Bit.Vector.Inline<wordCount>` they cover positions below the count. For `Bit.Vector.Bounded` they cover positions below capacity, so `zeros` also yields the unused positions past the count.
- `all.true` and `all.false` are both true for an empty vector. `statistic.false` is the count minus `statistic.true`.
- Equality and hashing of `Bit.Vector.Bounded` and `Bit.Vector.Inline<wordCount>` compare the count and the bits below it. Capacity is not compared.
- `take()` returns the current contents and leaves an empty vector of the same capacity in its place: all bits zero for `Bit.Vector`, count zero for `Bit.Vector.Bounded`.
- Converting a `Bit.Vector.Bounded` or `Bit.Vector.Inline<wordCount>` to `Bit.Vector.Dynamic` keeps the count and every bit below it.
