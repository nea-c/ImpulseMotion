
# 単位ベクトル値取得

tp @s ^1 ^ ^
data modify storage impulse_motion: _.Pos set from entity @s Pos
function impulse_motion:local_to_world/1.x.m with storage impulse_motion: _.macro
tp @s ^ ^1 ^
data modify storage impulse_motion: _.Pos set from entity @s Pos
function impulse_motion:local_to_world/2.y.m with storage impulse_motion: _.macro
tp @s ^ ^ ^1
data modify storage impulse_motion: _.Pos set from entity @s Pos
function impulse_motion:local_to_world/3.z.m with storage impulse_motion: _.macro


# 合計にする
scoreboard players operation #impulse_motion PlayerImpulse.X = #impulse_motion.left PlayerImpulse.X
scoreboard players operation #impulse_motion PlayerImpulse.X += #impulse_motion.left PlayerImpulse.Y
scoreboard players operation #impulse_motion PlayerImpulse.X += #impulse_motion.left PlayerImpulse.Z

scoreboard players operation #impulse_motion PlayerImpulse.Y = #impulse_motion.up PlayerImpulse.X
scoreboard players operation #impulse_motion PlayerImpulse.Y += #impulse_motion.up PlayerImpulse.Y
scoreboard players operation #impulse_motion PlayerImpulse.Y += #impulse_motion.up PlayerImpulse.Z

scoreboard players operation #impulse_motion PlayerImpulse.Z = #impulse_motion.forward PlayerImpulse.X
scoreboard players operation #impulse_motion PlayerImpulse.Z += #impulse_motion.forward PlayerImpulse.Y
scoreboard players operation #impulse_motion PlayerImpulse.Z += #impulse_motion.forward PlayerImpulse.Z


# リセット
scoreboard players reset #impulse_motion.left
scoreboard players reset #impulse_motion.up
scoreboard players reset #impulse_motion.forward


# マーカー位置修正
tp @s 0.0 0.0 0.0