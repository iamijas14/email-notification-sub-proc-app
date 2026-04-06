%dw 2.0
output application/json

var previousChange = valuesOf(vars.previousUpdate)
---
keysOf(vars.currentData filterObject ((value, key, index) -> !(previousChange contains value)))