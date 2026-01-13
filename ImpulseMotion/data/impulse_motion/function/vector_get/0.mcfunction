
# 単位ベクトル値取得

tp @s ^1 ^ ^
data modify storage impulse_motion: _.Pos set from entity @s Pos
function impulse_motion:vector_get/1.x.m with storage impulse_motion: _.macro
tp @s ^ ^1 ^
data modify storage impulse_motion: _.Pos set from entity @s Pos
function impulse_motion:vector_get/2.y.m with storage impulse_motion: _.macro
tp @s ^ ^ ^1
data modify storage impulse_motion: _.Pos set from entity @s Pos
function impulse_motion:vector_get/3.z.m with storage impulse_motion: _.macro


# 合計にする
scoreboard players operation #impulse_motion ImpulseMotion.X = #impulse_motion.PowerX ImpulseMotion.X
scoreboard players operation #impulse_motion ImpulseMotion.X += #impulse_motion.PowerY ImpulseMotion.X
scoreboard players operation #impulse_motion ImpulseMotion.X += #impulse_motion.PowerZ ImpulseMotion.X

scoreboard players operation #impulse_motion ImpulseMotion.Y = #impulse_motion.PowerX ImpulseMotion.Y
scoreboard players operation #impulse_motion ImpulseMotion.Y += #impulse_motion.PowerY ImpulseMotion.Y
scoreboard players operation #impulse_motion ImpulseMotion.Y += #impulse_motion.PowerZ ImpulseMotion.Y

scoreboard players operation #impulse_motion ImpulseMotion.Z = #impulse_motion.PowerX ImpulseMotion.Z
scoreboard players operation #impulse_motion ImpulseMotion.Z += #impulse_motion.PowerY ImpulseMotion.Z
scoreboard players operation #impulse_motion ImpulseMotion.Z += #impulse_motion.PowerZ ImpulseMotion.Z

# リセット
scoreboard players reset #impulse_motion.PowerX
scoreboard players reset #impulse_motion.PowerY
scoreboard players reset #impulse_motion.PowerZ


# マーカー位置修正
tp @s 0.0 0.0 0.0