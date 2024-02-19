"""
    MyPuzzleRecordModel

TODO: Add documentation
"""

abstract type AbstractPuzzleRecordModel end
# TODO: Finish the MyPuzzleRecordModel type
mutable struct MyPuzzleRecordModel <: AbstractPuzzleRecordModel

    # data
    record::String
    characters::Array{Char, 1}
    len::Int64

    # build constructor
    MyPuzzleRecordModel(record::String) = new(record, collect(record), length(record));
end