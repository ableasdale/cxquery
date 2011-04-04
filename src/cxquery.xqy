xquery version "1.0" encoding "utf-8"; 

module namespace cxq = "http://cxquery.com/cxquery";

declare function cxq:seq-contains($string as xs:string, $searchStrings as xs:string*) as xs:boolean {
    some $searchString in $searchStrings satisfies ($string eq $searchString)
};

declare function cxq:contains-element($element as node(), $sequence as node()*) as xs:boolean {
    some $item in $sequence satisfies ($element eq $item)
};