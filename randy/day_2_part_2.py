"""
--- Part Two ---
The Elf finishes helping with the tent and sneaks back over to you. "Anyway, the second column says how the round needs to end: X means you need to lose, Y means you need to end the round in a draw, and Z means you need to win. Good luck!"

The total score is still calculated in the same way, but now you need to figure out what shape to choose so the round ends as indicated. The example above now goes like this:

In the first round, your opponent will choose Rock (A), and you need the round to end in a draw (Y), so you also choose Rock. This gives you a score of 1 + 3 = 4.
In the second round, your opponent will choose Paper (B), and you choose Rock so you lose (X) with a score of 1 + 0 = 1.
In the third round, you will defeat your opponent's Scissors with Rock for a score of 1 + 6 = 7.
Now that you're correctly decrypting the ultra top secret strategy guide, you would get a total score of 12.

Following the Elf's instructions for the second column, what would your total score be if everything goes exactly according to your strategy guide?
"""
my_results = []
with open("day2_input.txt", "r") as f:
    data = f.read()
decoded = data.replace("A", "Rock").replace("B", "Paper").replace("C", "Scissors").replace("X", "Lose").replace("Y", "Draw").replace("Z", "Win")
points_table = {
    "Rock Lose": 3,
    "Rock Draw": 4,
    "Rock Win": 8,
    "Paper Lose": 1,
    "Paper Draw": 5,
    "Paper Win": 9,
    "Scissors Lose": 2,
    "Scissors Draw": 6,
    "Scissors Win": 7,
}
strategy_guide = decoded.split("\n")
for i in strategy_guide:
    my_results.append(points_table[i])
sum(my_results)