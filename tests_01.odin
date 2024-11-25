package test

import "core:fmt"
import "core:sys/windows"
import "core:time"
print :: fmt.println

main :: proc() {
	val: int
	windows.SetConsoleOutputCP(windows.CODEPAGE.UTF8)
	start: time.Time = time.now()

	// code goes here
	// print(sumOfPerfectCubes([]int{1, 8, 27, 4, 5, 6}))
	for _ in 0 ..< 100_000 {
		val = sumOfPerfectCubes([]int{1, 8, 27, 4, 5, 6})
	}

	elapsed: time.Duration = time.since(start)
	print("Odin took:", elapsed)

	print(val)

	// OUTPUT:
	// 36
	// Odin took: 100.4µs 
}


sumOfPerfectCubes :: proc(l: []int) -> int {
	total := 0
	for val in l {
		if is_perfect_cube(val) {
			total += val
		}
	}

	return total
}

is_perfect_cube :: proc(n: int) -> bool {
	// guard clause ------------------------------
	if n == 1 {
		return true
	}
	// -------------------------------------------

	num := 2
	for {
		num_cubed := num * num * num
		if n > num_cubed do num += 1
		else if n == num_cubed do return true
		else if n < num_cubed do return false
	}
}
