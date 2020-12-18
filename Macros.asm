macro aling value { db value-1 - ($ + value-1) mod (value) dup 0 }
HEADS = 1
SPT = 4
Begin:
	file "BootLoader.bin", 512
	file "Kernel.bin"
	aling 512
	aling HEADS*SPT*512