
--ativando utf-8
os.execute("chcp 65001")
print("")
---Criando um simulador de batalhas em turnos

---PlayerCard
local playerCard = {
      status = {
        nivel = 1,
        forca =  1,
        agilidade = 1,
        vidaMax = 10,
        vida = 10,
        inteligencia = 1
    },
    inventory = {
        escudo = false,
    },
    potions =  {
        regeneracao = 3,
    }  
}
local player = playerCard

---Lista de bosses e mobs para enfrentar
local Bestiario = {
    ['idboss1'] = {
            
                introdutorio = 'Voce estava andando pela floresta quando escuta um barulho atrás de voce, logo voce avista um mal em seu caminho',
                nome = 'GIANT ORC',
                sinopse = 'gigante, agressivo e imparavel',
                tipo = 'Mob',
                aparencia = 'Um ogro massivo, e sedento por crueldade',
                personalidade = 'Forte, agil e selvagem',
                bioma = 'floresta',

           
                forca = 7,
                agilidade = 5,
                vidaFake = 7,
                vidaMax = 20, 
                vida = 20,
                inteligencia = 3,
                perigo = 7,
              
            
    }
}

--Tela inicial
print([[
================================================================================

              />
 (           //-------------------------------------(
(*)OXOXOXOXO(*>======================================\
 (           \\---------------------------------------)
              \>

                         SIMULADOR DE BATALHAS
================================================================================
]])

--Pergunta para iniciar o game
    print("Qual seu nome, bravo guerreiro?")
    print("")
    local playerName = io.read():upper()
    print("")
    print([[Deseja iniciar sua aventura?
            Sim/Não
    ]])
    local StartQuestion = io.read():lower()


    if StartQuestion =='sim' or StartQuestion == 's' then
        print("")
        print("PEGUE SUA ESPADA E VAMOS A LUTA! A HORA DA BATALHA CHEGOU!")
        print("================================================================================")
    else
        print("")
        print("Você nunca poderá fugir das suas batalhas, sua espada o aguarda")
        print("================================================================================")
        --retorna para o inicio
        return playerName
    end

---função barra de status/progresso
local function getProgressBar(num)
    local fullChar = '⬜'
    local emptyChar = '🔳' 
    local result = ''
   for i = 1, 10, 1 do 
        if i <= num then
            result = result .. fullChar
        else
            result = result .. emptyChar
        end
    end
    return result
end

local function getLifeBar(num)
    local fullChar = '⬜'
    local emptyChar = '🔳' 
    local result = ''
   for i = 1, 20, 1 do 
        if i <= num then
            result = result .. fullChar
        else
            result = result .. emptyChar
        end
    end
    return result
end
---Checar status e inventario do personagem
local function printarStatus(value)
    for key, value in pairs(value) do
        print("     ".. key .. "    " .. value)
    end
end

local function printarItens(value)
    for key, value in pairs(value) do
        local estado = value and 'Possui' or 'Nao possui'
        print("     ".. key .. "    " .. estado)
    end
end

local function checkInventory()
    print(playerName .. ' MENU')
    print(" Status")
    printarStatus(playerCard.status)
    print('')
    print(" Inventory")
    printarItens(playerCard.inventory)
    print('')
    print(" Poções")
    printarStatus(playerCard.potions)
    print('')
end

---Função Card para o inimigo
local mob = Bestiario['idboss1']

local function viewEnemy(mob)
    print("")
    print(mob.introdutorio)
    print("")
    print('[' .. mob.nome .. ']')
    print('     Sinopse: '.. mob.sinopse)
    print('     Tipo: '.. mob.tipo)
    print('     Aparencia: '.. mob.aparencia)
    print('     Personalidade: '.. mob.personalidade)
    print("")
    print("Atributos")
    print('     Vitalidade:   '.. getProgressBar(mob.vidaFake))
    print('     Força:        '.. getProgressBar(mob.forca))
    print('     Perigo:       '.. getProgressBar(mob.perigo))
    print('     agilidade:    '.. getProgressBar(mob.agilidade))
    print('     Inteligencia: '.. getProgressBar(mob.inteligencia))
    print("")
end

viewEnemy(mob)

---Sistema de ciclo com turnos
while true do
print([[
    ================================================================================
]])
    --turno do player
    --ações
    print([[
    Oque voce quer fazer?
        1. Atacar inimigo

        2. Usar item

    ]])
    --escolher ações
    local escolha = io.read()
print([[
    ================================================================================
]])
    --sistema para responder as escolhas

    --Remediação para erros
    if escolha == nil then
        break
    --escolha 1
    elseif escolha == '1' then
        local danoJogador = math.random(1,10)
        mob.vida = mob.vida - danoJogador
        print("voce causou: " .. danoJogador)
    
        
    --escolha 2
    elseif escolha == '2' then
        print("")
        checkInventory()
        print("Deseja usar uma poção de regeneração? ")
        local itemSelect = io.read()
        if itemSelect == 'sim' or itemSelect == 's' then
            player.status.vida = 10
            player.potions.regeneracao = player.potions.regeneracao - 1
            print('Voce recuperou 10 de vida')
        end
    end

      --ponto de saida(mob)
        if mob.vida <= 0 then
            print([[
                -Voce derrotou o Boss
            ]])
            break
        end


    --turno do boss
    local mobEscolha = math.random(1,2)
    local mobDano = math.random(1,5)
    local mobHeal = math.random(1,8)

    if mobEscolha == 1 then
        player.status.vida = player.status.vida - mobDano
        print('O Boss causou '.. mobDano ..' de dano em voce')
    elseif mobEscolha == 2 then
        mob.vida = mob.vida + mobHeal
        print('O mob recuperou '.. mobHeal ..' de vida')
        if mob.vida > mob.vidaMax then
            mob.vida = mob.vidaMax
        end

    end

        local hpMob = math.floor((mob.vida / mob.vidaMax) * 20)
        local hpPlayer = math.floor((player.status.vida / player.status.vidaMax) * 10)
        print("Status Atual:")
        print("Sua vida" .. getProgressBar(hpPlayer))
        print("")
        print("Vida do inimigo" ..  getLifeBar(hpMob))
        
        
      --ponto de saida(player)
        if player.status.vida <= 0  then
                print([[
                    -Voce foi derrotado-
                ]])
                break
        end
end
