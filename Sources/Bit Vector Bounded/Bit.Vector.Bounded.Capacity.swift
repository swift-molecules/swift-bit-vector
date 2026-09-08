import Carrier
import Tagged
public import Cardinal_Tagged
import Property
public import Index
public import Ordinal
extension Bit.Vector.Bounded {

    public enum Capacity: Sendable {}
}

extension Bit.Vector.Bounded {

    @inlinable
    public var capacity: Property<Capacity, Self> {
        Property(self)
    }
}

extension Property where Tag == Bit.Vector.Bounded.Capacity, Base == Bit.Vector.Bounded {

    @inlinable
    public var maximum: Index<Bit>.Count { base._capacity }

    @inlinable
    public var remaining: Index<Bit>.Count { base._capacity.subtract.saturating(base._count) }
}
