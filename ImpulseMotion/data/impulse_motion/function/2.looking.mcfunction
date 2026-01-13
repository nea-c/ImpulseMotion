


# 入力値の取得
execute store result score #impulse_motion ImpulseMotion.X run data get storage impulse_motion: _.in.x 10000
execute store result score #impulse_motion ImpulseMotion.Y run data get storage impulse_motion: _.in.y 10000
execute store result score #impulse_motion ImpulseMotion.Z run data get storage impulse_motion: _.in.z 10000

# 値の修正
execute if score #impulse_motion ImpulseMotion.X matches 1000001.. run scoreboard players set #impulse_motion ImpulseMotion.X 1000000
execute if score #impulse_motion ImpulseMotion.X matches ..-1000001 run scoreboard players set #impulse_motion ImpulseMotion.X -1000000
execute if score #impulse_motion ImpulseMotion.Y matches 1000001.. run scoreboard players set #impulse_motion ImpulseMotion.Y 1000000
execute if score #impulse_motion ImpulseMotion.Y matches ..-1000001 run scoreboard players set #impulse_motion ImpulseMotion.Y -1000000
execute if score #impulse_motion ImpulseMotion.Z matches 1000001.. run scoreboard players set #impulse_motion ImpulseMotion.Z 1000000
execute if score #impulse_motion ImpulseMotion.Z matches ..-1000001 run scoreboard players set #impulse_motion ImpulseMotion.Z -100000

execute store result storage impulse_motion: _.macro.PowerX int 1 run scoreboard players get #impulse_motion ImpulseMotion.X
execute store result storage impulse_motion: _.macro.PowerY int 1 run scoreboard players get #impulse_motion ImpulseMotion.Y
execute store result storage impulse_motion: _.macro.PowerZ int 1 run scoreboard players get #impulse_motion ImpulseMotion.Z

# 変換
execute in neac: positioned 0.0 0.0 0.0 as 1604-1604-1604-1604-1604 run function impulse_motion:vector_get/0


function impulse_motion:3.motion_set

