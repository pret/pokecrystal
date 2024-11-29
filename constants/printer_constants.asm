; wPrinterStatus
	const_def 1
	const PRINTER_STATUS_CHECKING     ; 1
	const PRINTER_STATUS_TRANSMITTING ; 2
	const PRINTER_STATUS_PRINTING     ; 3
	const PRINTER_ERROR_1             ; 4
	const PRINTER_ERROR_2             ; 5
	const PRINTER_ERROR_3             ; 6
	const PRINTER_ERROR_4             ; 7

; wPrinterStatusFlags
	const_def 5
	shift_const PRINTER_STATUS_ERROR_3 ; 5
	shift_const PRINTER_STATUS_ERROR_4 ; 6
	shift_const PRINTER_STATUS_ERROR_1 ; 7

; wPrinterConnectionOpen
	const_def
	const PRINTER_CONNECTION_OPEN
	const PRINTER_CONNECTION_SUCCESS
