@_exported public import Difference
@_exported public import Bit_Pack
@_exported public import Bit
@_exported public import Cardinal
@_exported public import Addition
@_exported public import Property
@_exported public import Subtraction
@_exported public import Cardinal_Tagged
@_exported public import Iterator
@_exported public import Ordinal_Cardinal
@_exported public import Ordinal
@_exported public import Ordinal_Tagged
@_exported public import Ownership
@_exported public import Tagged
@_exported public import Sequence
@_exported public import Carrier

public typealias BitVectorElementIteratorProtocol = Iterator.`Protocol`

public typealias BitVectorMaterializingIterator<
    Source: Iterator.`Protocol` & ~Copyable & ~Escapable
> = Iterator.Materializing<Source>
where Source.Element: Copyable & Escapable
