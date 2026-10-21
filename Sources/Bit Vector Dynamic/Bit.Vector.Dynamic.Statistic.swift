public import Cardinal
import Carrier
public import Index
public import Ordinal
import Property
public import Tagged

extension Bit.Vector.Dynamic {

    public enum Statistic: Sendable {}
}

extension Bit.Vector.Dynamic {

    @inlinable
    public var statistic: Property<Statistic, Self> {
        Property(self)
    }
}

extension Property where Tag == Bit.Vector.Dynamic.Statistic, Base == Bit.Vector.Dynamic {

    @inlinable
    public var `true`: Index<Bit>.Count { base.popcount }

    @inlinable
    public var `false`: Index<Bit>.Count { base._count.subtract.saturating(base.popcount) }
}
