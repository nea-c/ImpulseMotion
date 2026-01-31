

execute store result score #impulse_motion neac_value run data get storage impulse_motion: _.in.multiplier.elytra 1000

scoreboard players operation #impulse_motion ImpulseMotion.Z *= #impulse_motion neac_value
scoreboard players operation #impulse_motion ImpulseMotion.Z /= #global 1000

