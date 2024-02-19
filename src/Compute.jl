# ===== PRIVATE METHODS BELOW HERE =================================================================================== #

function _findfirst(characters::Array{Char,1},map::Array{String,1})::String
    test = ""; #initialize a test string
    for char in characters
        # If there is a digit present before any map terms, just return that
        if isdigit(char)
            return string(char)
        end
        # Test stores each nondigit character
        test = "$(test)$(char)"
        for (digit, word) in enumerate(map)
            if contains(test,word) # Check to see if a word in the map occurs in test
                return string(digit) # If there's a mapping, store the word as first digit
            end
        end
    end
end

function _findlast(characters::Array{Char,1},map::Array{String,1})::String
    test = ""; #initialize a test string
    for char in reverse(characters)
        # If there is a digit present before any map terms, just return that
        if isdigit(char)
            return string(char)
        end
        # Test stores each nondigit character in reverse order
        test = "$(char)$(test)"
        for (digit, word) in enumerate(map)
            if contains(test,word) # Check to see if a word in the map occurs in test
                return string(digit) # If there's a mapping, store the word as last digit
            end
        end
    end
end
# ===== PRIVATE METHODS ABOVE HERE =================================================================================== #

# ===== PUBLIC METHODS BELOW HERE ==================================================================================== #
"""
    decode_part_1(models::Dict{Int64, MyPuzzleRecordModel}) -> Tuple{Int64, Dict{Int64, Int64}}

TODO: Add documentation
"""
function decode_part_1(models::Dict{Int64, MyPuzzleRecordModel})::Tuple{Int64, Dict{Int64, Int64}}
    
    # initialize -
    total = 0;
    codes = Dict{Int64, Int64}();
    firstdigit = string;
    lastdigit = string;

    for i in eachindex(models)
        for char in models[i].characters
            if isdigit(char)
                firstdigit = char;
                break
            end
        end
        for char in reverse(models[i].characters)
            if isdigit(char)
                lastdigit = char;
                break
            end
        end
        codes[i] = parse(Int64, "$(firstdigit)$(lastdigit)")
    end

    for i in eachindex(codes)
        total = total + codes[i];
    end

    # return the total -
    return (total, codes);
end

"""
    decode_part_2(models::Dict{Int64, MyPuzzleRecordModel}) -> Tuple{Int64, Dict{Int64, Int64}}

TODO: Add documentation
"""
function decode_part_2(models::Dict{Int64, MyPuzzleRecordModel})::Tuple{Int64, Dict{Int64, Int64}}
     
    # initialize -
    total = 0;
    codes = Dict{Int64, Int64}();
    firstdigit = string;
    lastdigit = string;
    map = ["one","two","three","four","five","six","seven","eight","nine"];

    for i in eachindex(models)
        firstdigit = _findfirst(models[i].characters,map);
        lastdigit = _findlast(models[i].characters,map);
        codes[i] = parse(Int64, "$(firstdigit)$(lastdigit)")
    end

    for i in eachindex(codes)
        total = total + codes[i];
    end
     
     # return the total -
     return (total, codes);
end
# ===== PUBLIC METHODS ABOVE HERE ==================================================================================== #