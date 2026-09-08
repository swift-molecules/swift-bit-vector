import Carrier
import Tagged
public import Cardinal_Tagged
import Property
public import Index
public import Ordinal
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
