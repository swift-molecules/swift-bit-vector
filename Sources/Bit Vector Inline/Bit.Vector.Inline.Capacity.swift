import Carrier
import Tagged
public import Cardinal_Tagged
import Property
import Ownership
public import Index
public import Ordinal
public import Ownership
extension Bit.Vector.Inline {

    public enum Capacity: Sendable {}
}

extension Bit.Vector.Inline.Capacity {

    public typealias View = Property<Self, Bit.Vector.Inline<wordCount>>.Inout.Typed<Bit>.Valued<
        wordCount
    >
}

extension Bit.Vector.Inline {

    @inlinable
    public var capacity: Capacity.View {
        mutating _read { yield.init(&self) }
    }
}

extension Property.Inout.Typed.Valued
where Tag == Bit.Vector.Inline<n>.Capacity, Base == Bit.Vector.Inline<n>, Element == Bit {

    @inlinable
    public var maximum: Index<Bit>.Count { Bit.Vector.Inline<n>._capacity }

    @inlinable
    public var remaining: Index<Bit>.Count {
        let count = base.value._count
        return Bit.Vector.Inline<n>._capacity.subtract.saturating(count)
    }
}
