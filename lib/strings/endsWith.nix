# Determines if the string `haystack` ends with the string `needle`
# endsWith :: needle:String -> haystack:String -> Bool

needle: haystack:
    if !builtins.isString needle || !builtins.isString haystack then
        abort "Both parameters for `endsWith` must be strings."
    else
    
    let
        needleLength = builtins.stringLength needle;
        start = builtins.stringLength haystack - needleLength;
    in
        builtins.substring start needleLength haystack == needle