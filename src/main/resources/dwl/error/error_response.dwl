%dw 2.0
output application/json skipNullOn = "everywhere"
import modules::Error

var errorResponse = Error::response(error)
var errorMessage = Error::message(error)
---
{
	"errorType": errorResponse.error,
	"statusCode": if (!isEmpty(errorResponse.statusCode)) (errorResponse.statusCode) else 500,
	"errorMessage": errorMessage,
	"extraDetails": if (!isEmpty(errorResponse.errorDetails)) (errorResponse.errorDetails)
			else if (!isEmpty(error.errorMessage.payload)) (error.errorMessage.payload)
			else null
}