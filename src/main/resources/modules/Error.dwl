%dw 2.0

fun isErrorNotNull(error) = (error != null) and (error.errorType != null) and (error.description != null)

fun message(error) =
	if (isErrorNotNull(error))(
		(error.errorType.namespace default "" as String) ++
		":" ++ (error.errorType.identifier default "" as String) ++
		" - " ++ (error.description default "" as String)
		)
		else ("")


fun response(error) =
	if (isErrorNotNull(error))
		{
			error: error.errorType.identifier default null,
			statusCode: error.errorMessage.attributes.statusCode default null,
			errorDetails: error.errorMessage.attributes.reasonPhrase default null,
		}
	else
		{
			error: "N/A",
			errorDetails: "Error Not Available",
			statusCode: 500
		}
