
# 単位ベクトル値取得

tp @s ^1 ^ ^
data modify storage player_impulse: _.Pos set from entity @s Pos
function player_impulse:local_to_world/1.x.m with storage player_impulse: _.macro
tp @s ^ ^1 ^
data modify storage player_impulse: _.Pos set from entity @s Pos
function player_impulse:local_to_world/2.y.m with storage player_impulse: _.macro
tp @s ^ ^ ^1
data modify storage player_impulse: _.Pos set from entity @s Pos
function player_impulse:local_to_world/3.z.m with storage player_impulse: _.macro


# 合計にする
scoreboard players operation #player_impulse PlayerImpulse.X = #player_impulse.left PlayerImpulse.X
scoreboard players operation #player_impulse PlayerImpulse.X += #player_impulse.left PlayerImpulse.Y
scoreboard players operation #player_impulse PlayerImpulse.X += #player_impulse.left PlayerImpulse.Z

scoreboard players operation #player_impulse PlayerImpulse.Y = #player_impulse.up PlayerImpulse.X
scoreboard players operation #player_impulse PlayerImpulse.Y += #player_impulse.up PlayerImpulse.Y
scoreboard players operation #player_impulse PlayerImpulse.Y += #player_impulse.up PlayerImpulse.Z

scoreboard players operation #player_impulse PlayerImpulse.Z = #player_impulse.forward PlayerImpulse.X
scoreboard players operation #player_impulse PlayerImpulse.Z += #player_impulse.forward PlayerImpulse.Y
scoreboard players operation #player_impulse PlayerImpulse.Z += #player_impulse.forward PlayerImpulse.Z


# リセット
scoreboard players reset #player_impulse.left
scoreboard players reset #player_impulse.up
scoreboard players reset #player_impulse.forward


# マーカー位置修正
tp @s 0.0 0.0 0.0