local BattleSystem = require "BattleSystem"
local utils = require("Utils")
local enemyData = require('Creature.Enemy')
local playerData = require ("Player.Player")
local system = require("BattleSystem")

--ativando utf-8
os.execute("chcp 65001")

local player = playerData
local boss = enemyData.monstro1

--SIMULADOR DE BATALHA EM TURNOS

--introdutorio
utils.header()
utils.viewEnemy(boss)


--hora da batalha
system.loopBattle()