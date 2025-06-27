--ativando utf-8
os.execute("chcp 65001")
print("")
--Criando um simulador de batalhas em turnos

--Inventario
local inventory = {
    espada = true,
    escudo = false,
    armadura = false,

    potions = {
        regeneration = true,
        strength = false,
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
print([[Deseja iniciar sua aventura?
                Sim/Não
]])

local StartQuestion = io.read():lower()
if StartQuestion =='sim' then
    print("PEGUE SUA ESPADA E VAMOS A LUTA! HORA DA BATALHA!")
else
    print("Você nunca poderá fugir das suas batalhas, sua espada o aguarda")

end

---função barra de status/progresso
local function getProgressBar(num)
    local fullChar = '▰'
    local emptyChar = '▱'
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

---Função para checar inventario
local function checkInventory(item)
    if inventory[item] == nil then
        print("item não encontrado")
    elseif inventory[item] then
        print("voce  tem o item") 
    else
        print("voce nao tem o item")
    end
end

local function checkPotion(item)
    if inventory.potions[item] == nil then
        print("item não encontrado")
    elseif inventory.potions[item] == true then
        print("possui poção")
    else
        print('não tem a poção')
    end
end

checkInventory('espada')
checkPotion('regeneration')
