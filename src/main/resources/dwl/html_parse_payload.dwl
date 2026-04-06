%dw 2.0
output application/java

var fieldNames = payload filter ($ != "LastModifiedDate")
---
if(!isEmpty(fieldNames))
(fieldNames map ((item, index) -> 
	'<tr><td class="label">' ++ item ++ '</td></tr>'
)) joinBy ""

else
'<tr><td class="label">N/A</td></tr>'