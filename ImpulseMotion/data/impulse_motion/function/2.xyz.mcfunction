


# 入力値の取得
execute store result score #impulse_motion ImpulseMotion.X run data get storage impulse_motion: _.in.x 10000
execute store result score #impulse_motion ImpulseMotion.Y run data get storage impulse_motion: _.in.y 10000
execute store result score #impulse_motion ImpulseMotion.Z run data get storage impulse_motion: _.in.z 10000

execute store result storage impulse_motion: _.macro.PowerX int 1 run scoreboard players get #impulse_motion ImpulseMotion.X
execute store result storage impulse_motion: _.macro.PowerY int 1 run scoreboard players get #impulse_motion ImpulseMotion.Y
execute store result storage impulse_motion: _.macro.PowerZ int 1 run scoreboard players get #impulse_motion ImpulseMotion.Z

# ローカル座標ベクトルへ変換
execute rotated as @s in neac: positioned 0.0 0.0 0.0 as 1604-1604-1604-1604-1604 run function impulse_motion:world_to_local/0


function impulse_motion:3.motion_set

