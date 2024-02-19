
# ===== PRIVATE METHODS BELOW HERE =================================================================================== #
# TODO: Put private helper methods here. Don't forget to use the _ naming convention, and to add basic documentation.
# ===== PRIVATE METHODS ABOVE HERE =================================================================================== #

# ===== PUBLIC METHODS BELOW HERE =================================================================================== #
# TODO: Make a build method to construct MyPuzzleRecordModel types
function build(encoded_line::String)::MyPuzzleRecordModel
    recordModel = MyPuzzleRecordModel(encoded_line);
    return recordModel;
end
# ===== PUBLIC METHODS ABOVE HERE =================================================================================== #