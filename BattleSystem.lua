local playerData = require('Player.Player')
local enemyData = require('Creature.Enemy')
local actions   = require('Actions')
local utils = require('Utils')

local player = playerData
local boss = enemyData.monstro1
 
local system = {}

--Sistema de loop de escolhas

function system.loopBattle()
    while true do
       --header
        print("")
        print("/1. Atacar")
        print("")
        print("/2. Bloquear ataque")
        print("")
        if playerData.potions > 0 then
        print("/3. Se curar")
       end

    ---Turno do PLAYER
    print("")   
    print(" Escolha a sua ação")
       io.write(">")
        local Ask = actions.wayAsk()

        --pausa de 1 segundo
        os.execute("ping -n 2 localhost > nul") -- wait(1) or task.wait(1)
        if Ask == 1 then
            actions.playerDamage()
        elseif Ask == 3 then
            actions.healLife()
        elseif Ask == 2 then
            actions.blockAttack()
        end
        --saida para player
        if boss.life <= 0 then
            print('Você Venceu, Parabéns!')
            break
        end

        ---turno do BOSS
        actions.bossDamage()

        --saida para boss
        if player.life <= 0 then
            print('Você foi derrotado!')
            break
        end
        
        --pausa de 1 segundo
        os.execute("ping -n 2 localhost > nul")

        --barra de vida do player e do boss
        print("Sua vida".. utils.getProgressBar(playerData.life, playerData.maxLife))
        print("Vida do boss".. utils.getProgressBar(boss.life, boss.maxLife))
    end

end

return system
