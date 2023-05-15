%dw 2.0
output application/json
/*
Here i used flatmap to merge array of arrays to single Array as of my desired output Requirement and also i have mapping the fields based on the Requirement 
Basically flatten is used to convert multiple Arrays in to a single Array
*/


---
items: payload.data flatMap ((item, index) -> 
{
    dt: item.products flatMap ((items, index) ->
    {
        dt1: items.variations map
        {
            uprice: $.price,
            eprice: $.price_unit,
            lineId: $.lineid,
            itemId: item.id
        }
    }.dt1)
}.dt)

