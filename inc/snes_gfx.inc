inline setMapPriorityBit(size) {
	if ({size} & 1) == 1 {
		error "setMapPriorityBit() size is not even"
	}
	origin origin()-{size}
	define x = 0
	while {x} < {size} {
		db (read(origin()))
		db (read(origin()) | 0x20)
		evaluate x = ({x} + 2)
	}
}
