"""
--- Part Two ---
It seems like there is still quite a bit of duplicate work planned. Instead, the Elves would like to know the number of pairs that overlap at all.

In the above example, the first two pairs (2-4,6-8 and 2-3,4-5) don't overlap, while the remaining four pairs (5-7,7-9, 2-8,3-7, 6-6,4-6, and 2-6,4-8) do overlap:

5-7,7-9 overlaps in a single section, 7.
2-8,3-7 overlaps all of the sections 3 through 7.
6-6,4-6 overlaps in a single section, 6.
2-6,4-8 overlaps in sections 4, 5, and 6.
So, in this example, the number of overlapping assignment pairs is 4.

In how many assignment pairs do the ranges overlap?
"""
with open("day4_input.txt", "r") as f:
    data = f.read()
pairs = data.split("\n")
overlap_count = 0
for i in range(0, len(pairs)):
    pair = pairs[i].split(",")
    first = [int(i) for i in (pair[0].split("-"))]
    second = [int(i) for i in (pair[1].split("-"))]
    first_list = [item for item in range(first[0], first[1]+1)]
    second_list = [item for item in range(second[0], second[1]+1)]
    overlap = [item for item in first_list if item in second_list]
    if len(overlap) > 0:
        overlap_count += 1
overlap_count