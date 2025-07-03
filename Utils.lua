local playerData = require ("Player.Player")
local enemyData = require("Creature.Enemy")

local boss = enemyData.monstro1

local utils = {}
    
---tela inicial do projeto
function utils.header()
print([[
=============================================================================================

              <>
             //
            //
    <>(((((((({@}::::::::::::::::::::::::::::::::::::::::::::::::::::======-
            \\
             \\
              <>

=============================================================================================
                                    SIMULADOR DE BATALHAS   

=============================================================================================

                            É HORA DA BATALHA, EMPUNHE SUA ESPADA!
    ]])
end

--Barra de progresso
function utils.getProgressBar(current, max, size)
    local fullChar = '⬜'
    local emptyChar = '🔳'
    local result = ''
    size = size or 10  -- tamanho padrão da barra é 10 se não for passado
    max = max or 10    -- tamanho padrão da barra é 10 se não for passado

    -- Evita divisão por zero e limita o valor máximo a 1
    local percent = 0
    if max > 0 then
        percent = math.min(current / max, 1)
    end

    local filledBars = math.floor(percent * size)
    local emptyBars = size - filledBars

    result = string.rep(fullChar, filledBars) .. string.rep(emptyChar, emptyBars)

    return result
end

--PlayerCard
function utils.viewEnemy(boss)
    print("/  Descrição: ".. boss.description)
    print("/")
    print("/   ".. boss.name)
    print('/     Tipo: '.. boss.tipo)
    print("/")
    print('/        Vitalidade:     '.. utils.getProgressBar(boss.life, boss.maxLife))
    print('/        Força:          '.. utils.getProgressBar(boss.strength))
    print('/        Agilidade:      '.. utils.getProgressBar(boss.speed))
    print('/        Inteligencia:   '.. utils.getProgressBar(boss.smartness))
    print("")
    print("=============================================================================================")
    print("")
end


return utils
