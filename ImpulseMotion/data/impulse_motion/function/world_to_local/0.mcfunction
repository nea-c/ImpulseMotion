
# 単位ベクトル値取得

tp @s ^1 ^ ^
data modify storage impulse_motion: _.Pos set from entity @s Pos
function impulse_motion:world_to_local/1.x.m with storage impulse_motion: _.macro
tp @s ^ ^1 ^
data modify storage impulse_motion: _.Pos set from entity @s Pos
function impulse_motion:world_to_local/2.y.m with storage impulse_motion: _.macro
tp @s ^ ^ ^1
data modify storage impulse_motion: _.Pos set from entity @s Pos
function impulse_motion:world_to_local/3.z.m with storage impulse_motion: _.macro


# 合計にする
scoreboard players operation #impulse_motion ImpulseMotion.X = #impulse_motion.left ImpulseMotion.X
scoreboard players operation #impulse_motion ImpulseMotion.X += #impulse_motion.left ImpulseMotion.Y
scoreboard players operation #impulse_motion ImpulseMotion.X += #impulse_motion.left ImpulseMotion.Z

scoreboard players operation #impulse_motion ImpulseMotion.Y = #impulse_motion.up ImpulseMotion.X
scoreboard players operation #impulse_motion ImpulseMotion.Y += #impulse_motion.up ImpulseMotion.Y
scoreboard players operation #impulse_motion ImpulseMotion.Y += #impulse_motion.up ImpulseMotion.Z

scoreboard players operation #impulse_motion ImpulseMotion.Z = #impulse_motion.forward ImpulseMotion.X
scoreboard players operation #impulse_motion ImpulseMotion.Z += #impulse_motion.forward ImpulseMotion.Y
scoreboard players operation #impulse_motion ImpulseMotion.Z += #impulse_motion.forward ImpulseMotion.Z


# リセット
scoreboard players reset #impulse_motion.left
scoreboard players reset #impulse_motion.up
scoreboard players reset #impulse_motion.forward


# マーカー位置修正
tp @s 0.0 0.0 0.0