RS = game:GetService("ReplicatedStorage")
Dice = require(RS:WaitForChild("Shared"):WaitForChild("Dice"))
TestTile = game:GetService("Workspace"):WaitForChild("TestTile")

print(Dice.Roll(6,3))
print(TestTile.Name)
