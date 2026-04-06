%dw 2.0
import modules::Error
output application/json

var errorResponse = Error::response(error)
---
errorResponse.statusCode default 500