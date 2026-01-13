
# 単位ベクトル値取得

tp @s ^1 ^ ^
data modify storage player_impulse: _.Pos set from entity @s Pos
function player_impulse:vector_get/1.x.m with storage player_impulse: _.macro
tp @s ^ ^1 ^
data modify storage player_impulse: _.Pos set from entity @s Pos
function player_impulse:vector_get/2.y.m with storage player_impulse: _.macro
tp @s ^ ^ ^1
data modify storage player_impulse: _.Pos set from entity @s Pos
function player_impulse:vector_get/3.z.m with storage player_impulse: _.macro


# 合計にする
scoreboard players operation #player_impulse PlayerImpulse.X = #player_impulse.PowerX PlayerImpulse.X
scoreboard players operation #player_impulse PlayerImpulse.X += #player_impulse.PowerY PlayerImpulse.X
scoreboard players operation #player_impulse PlayerImpulse.X += #player_impulse.PowerZ PlayerImpulse.X

scoreboard players operation #player_impulse PlayerImpulse.Y = #player_impulse.PowerX PlayerImpulse.Y
scoreboard players operation #player_impulse PlayerImpulse.Y += #player_impulse.PowerY PlayerImpulse.Y
scoreboard players operation #player_impulse PlayerImpulse.Y += #player_impulse.PowerZ PlayerImpulse.Y

scoreboard players operation #player_impulse PlayerImpulse.Z = #player_impulse.PowerX PlayerImpulse.Z
scoreboard players operation #player_impulse PlayerImpulse.Z += #player_impulse.PowerY PlayerImpulse.Z
scoreboard players operation #player_impulse PlayerImpulse.Z += #player_impulse.PowerZ PlayerImpulse.Z

# リセット
scoreboard players reset #player_impulse.PowerX
scoreboard players reset #player_impulse.PowerY
scoreboard players reset #player_impulse.PowerZ


# マーカー位置修正
tp @s 0.0 0.0 0.0