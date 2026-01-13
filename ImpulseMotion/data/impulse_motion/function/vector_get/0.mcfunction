
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
scoreboard players operation #impulse_motion PlayerImpulse.X = #impulse_motion.PowerX PlayerImpulse.X
scoreboard players operation #impulse_motion PlayerImpulse.X += #impulse_motion.PowerY PlayerImpulse.X
scoreboard players operation #impulse_motion PlayerImpulse.X += #impulse_motion.PowerZ PlayerImpulse.X

scoreboard players operation #impulse_motion PlayerImpulse.Y = #impulse_motion.PowerX PlayerImpulse.Y
scoreboard players operation #impulse_motion PlayerImpulse.Y += #impulse_motion.PowerY PlayerImpulse.Y
scoreboard players operation #impulse_motion PlayerImpulse.Y += #impulse_motion.PowerZ PlayerImpulse.Y

scoreboard players operation #impulse_motion PlayerImpulse.Z = #impulse_motion.PowerX PlayerImpulse.Z
scoreboard players operation #impulse_motion PlayerImpulse.Z += #impulse_motion.PowerY PlayerImpulse.Z
scoreboard players operation #impulse_motion PlayerImpulse.Z += #impulse_motion.PowerZ PlayerImpulse.Z

# リセット
scoreboard players reset #impulse_motion.PowerX
scoreboard players reset #impulse_motion.PowerY
scoreboard players reset #impulse_motion.PowerZ


# マーカー位置修正
tp @s 0.0 0.0 0.0