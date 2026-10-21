public import Cardinal
import Carrier
public import Index
public import Ordinal
import Property
public import Tagged

extension Bit.Vector.Bounded {

    public enum Statistic: Sendable {}
}

extension Bit.Vector.Bounded {

    @inlinable
    public var statistic: Property<Statistic, Self> {
        Property(self)
    }
}

extension Property where Tag == Bit.Vector.Bounded.Statistic, Base == Bit.Vector.Bounded {

    @inlinable
    public var `true`: Index<Bit>.Count { base.popcount }

    @inlinable
    public var `false`: Index<Bit>.Count { base._count.subtract.saturating(base.popcount) }
}
