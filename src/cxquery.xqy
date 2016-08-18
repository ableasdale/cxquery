xquery version "1.0" encoding "utf-8"; 

module namespace cxq = "http://cxquery.com/cxquery";

declare function cxq:seq-contains($string as xs:string, $searchStrings as xs:string*) as xs:boolean {
    some $searchString in $searchStrings satisfies ($string eq $searchString)
};

declare function cxq:contains-element($element as node(), $sequence as node()*) as xs:boolean {
    some $item in $sequence satisfies ($element eq $item)
};

declare function cxq:highest-frequency-item-in-sequence($sequence as item()*) {
    for $max-freq in fn:max(for $val in fn:distinct-values($sequence)
    return fn:count(fn:index-of($sequence, $val)))
    return fn:distinct-values($sequence)[fn:count(fn:index-of($sequence, .)) eq $max-freq]
};