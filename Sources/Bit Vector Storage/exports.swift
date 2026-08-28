@_exported public import Affine_Tagged
@_exported public import Bit_Pack
@_exported public import Bit
@_exported public import Cardinal_Carrier
@_exported public import Cardinal_Comparison
@_exported public import Cardinal_Property
@_exported public import Cardinal_Tagged
@_exported public import Iterator
@_exported public import Ordinal_Cardinal
@_exported public import Ordinal_Comparison
@_exported public import Ordinal_Tagged
@_exported public import Ownership
@_exported public import Property
@_exported public import Property_Ownership
@_exported public import Sequence
@_exported public import Tagged_Carrier

public typealias BitVectorElementIteratorProtocol = Iterator.`Protocol`

public typealias BitVectorMaterializingIterator<
    Source: Iterator.`Protocol` & ~Copyable & ~Escapable
> = Iterator.Materializing<Source>
where Source.Element: Copyable & Escapable
