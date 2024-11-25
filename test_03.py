import timeit


def is_perfect_cube(n: int) -> bool:
    # guard clause ------------------------------
    if n == 1:
        return True
    # -------------------------------------------

    num = 2
    while True:
        if n > (num * num * num):
            num += 1
        if n == (num * num * num):
            return True
        if n < (num * num * num):
            return False


def sumOfPerfectCubes(l: list[int]) -> int:
    total = 0
    for val in l:
        if is_perfect_cube(val):
            total += val

    return total


def main() -> None:

    t_0 = timeit.default_timer()

    for _ in range(100_000):
        # print(sumOfPerfectCubes([1, 8, 27, 4, 5, 6]))
        love = sumOfPerfectCubes([1, 8, 27, 4, 5, 6])

    t_1 = timeit.default_timer()

    # calculate elapsed time and print
    elapsed_time = round((t_1 - t_0) * 10 ** 6, 3)
    print(f"Elapsed time: {elapsed_time} µs")


if __name__ == '__main__':
    main()

# sumOfPerfectCubes([1, 8, 27, 4, 5, 6]) => 36
