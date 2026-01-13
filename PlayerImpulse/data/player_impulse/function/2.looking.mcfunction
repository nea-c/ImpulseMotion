


# 入力値の取得
execute store result score #player_impulse PlayerImpulse.X run data get storage player_impulse: _.in.x 10000
execute store result score #player_impulse PlayerImpulse.Y run data get storage player_impulse: _.in.y 10000
execute store result score #player_impulse PlayerImpulse.Z run data get storage player_impulse: _.in.z 10000

# 値の修正
execute if score #player_impulse PlayerImpulse.X matches 1000001.. run scoreboard players set #player_impulse PlayerImpulse.X 1000000
execute if score #player_impulse PlayerImpulse.X matches ..-1000001 run scoreboard players set #player_impulse PlayerImpulse.X -1000000
execute if score #player_impulse PlayerImpulse.Y matches 1000001.. run scoreboard players set #player_impulse PlayerImpulse.Y 1000000
execute if score #player_impulse PlayerImpulse.Y matches ..-1000001 run scoreboard players set #player_impulse PlayerImpulse.Y -1000000
execute if score #player_impulse PlayerImpulse.Z matches 1000001.. run scoreboard players set #player_impulse PlayerImpulse.Z 1000000
execute if score #player_impulse PlayerImpulse.Z matches ..-1000001 run scoreboard players set #player_impulse PlayerImpulse.Z -100000

execute store result storage player_impulse: _.macro.PowerX int 1 run scoreboard players get #player_impulse PlayerImpulse.X
execute store result storage player_impulse: _.macro.PowerY int 1 run scoreboard players get #player_impulse PlayerImpulse.Y
execute store result storage player_impulse: _.macro.PowerZ int 1 run scoreboard players get #player_impulse PlayerImpulse.Z

# 変換
execute in neac: positioned 0.0 0.0 0.0 as 1604-1604-1604-1604-1604 run function player_impulse:vector_get/0


function player_impulse:3.motion_set

