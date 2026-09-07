import Tagged_Carrier
public import Cardinal_Tagged
import Property
import Property_Ownership
public import Index
public import Ordinal_Protocol
public import Ownership
extension Bit.Vector.Inline {

    public enum Statistic: Sendable {}
}

extension Bit.Vector.Inline.Statistic {

    public typealias View = Property<Self, Bit.Vector.Inline<wordCount>>.Inout.Typed<Bit>.Valued<
        wordCount
    >
}

extension Bit.Vector.Inline {

    @inlinable
    public var statistic: Statistic.View {
        mutating _read { yield.init(&self) }
    }
}

extension Property.Inout.Typed.Valued
where Tag == Bit.Vector.Inline<n>.Statistic, Base == Bit.Vector.Inline<n>, Element == Bit {

    @inlinable
    public var `true`: Index<Bit>.Count { base.value.popcount }

    @inlinable
    public var `false`: Index<Bit>.Count {
        base.value._count.subtract.saturating(base.value.popcount)
    }
}
