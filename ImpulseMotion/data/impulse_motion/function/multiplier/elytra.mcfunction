

execute store result storage impulse_motion: _.macro.PowerZ int 1 run scoreboard players get #impulse_motion ImpulseMotion.Z

data modify storage impulse_motion: _.macro.PowerZ set compute default float {type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.macro.PowerZ"},{type:"storage",storage:"impulse_motion:",path:"_.in.multiplier.elytra"}]}

execute store result score #impulse_motion ImpulseMotion.Z run data get storage impulse_motion: _.macro.PowerZ 1

