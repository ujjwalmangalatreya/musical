class ApiError extends Error {
    constructor(
        statusCode,
        message = "Something went wrong",
        errors = [],
        statck = ""
    ) {
        super(message)
        this.statusCode = statusCode,
            this.data = null,
            this.message = message,
            this.errors = errors,
            thi.success = false

        if (statck) {
            this .stack = statck
        } else {
            Error.captureStackTrace(thi,this.constructor)
        }
    }
}
export {ApiError}