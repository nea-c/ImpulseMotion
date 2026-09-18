


# 入力値の取得
execute store result score #impulse_motion ImpulseMotion.X run data get storage impulse_motion: _.in.x 10000
execute store result score #impulse_motion ImpulseMotion.Y run data get storage impulse_motion: _.in.y 10000
execute store result score #impulse_motion ImpulseMotion.Z run data get storage impulse_motion: _.in.z 10000

function impulse_motion:4.motion_set

