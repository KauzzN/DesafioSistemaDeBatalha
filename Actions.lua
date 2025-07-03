local playerData = require("Player.Player")
local enemyData = require("Creature.Enemy")

local boss = enemyData.monstro1

local actions = {}

---função para perguntas
function actions.wayAsk()
    local ask = io.read():lower()
    local num = tonumber(ask)
    if num == 1 or num == 2 or num == 3 then
        return num
    else
        print("Escolha inválida, escolha um numero de a 2")
        io.write(">")
    end
end

--função para player causar dano no boss
function actions.playerDamage()

    local avgDamage = math.floor(boss.maxLife / playerData.strength)
    local damagePlayer = math.random(avgDamage)

    boss.life = boss.life - damagePlayer 
    print("Você causou ".. damagePlayer .." de dano!")
    print("")
end

function actions.healLife()

    if playerData.potions > 0 then
        playerData.life = playerData.maxLife
        playerData.potions = playerData.potions - 1
        print("Voce recuperou sua vida inteira")
    else 
        print("Você não possui poções")
    end
end

 local isBlocking = false

function actions.blockAttack()
    isBlocking = true
end

function actions.bossDamage()

    local avgDamage = math.floor(playerData.maxLife / boss.strength)
    local damageBoss = math.random(avgDamage)

    if isBlocking then
        damageBoss = math.floor(damageBoss / 2)
        isBlocking = false
        print("Você bloqueou o ataque")
    end

    playerData.life = playerData.life - damageBoss 
    print("Você sofreu ".. damageBoss .." de dano")
    print("")
    
end



return actions
