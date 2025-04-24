local Dice = {}

function Dice.new(faces: number)
    return setmetatable({
        Faces = faces
    }, Dice)
end

-- static dice roll function for when storing a Dice object isn't necessary
function Dice.Roll(faces, quantity)
    print("Rolling Dice")
    if faces <= 0 or quantity <= 0 then
        error("Invalid Dice Roll: Faces and Quantity must be > 0")
    elseif quantity > 1 then
        return math.random(faces) + Dice.Roll(faces, quantity - 1)
    else 
        return math.random(faces)
    end
end

-- roll method for Dice objects
return Dice