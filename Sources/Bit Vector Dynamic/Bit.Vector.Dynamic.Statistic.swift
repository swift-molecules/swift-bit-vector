import Tagged_Carrier
public import Cardinal_Tagged
import Property
public import Index
public import Ordinal_Protocol
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
