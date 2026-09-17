


execute store result storage impulse_motion: _.macro.PowerX int 1 run scoreboard players get #impulse_motion ImpulseMotion.X
execute store result storage impulse_motion: _.macro.PowerY int 1 run scoreboard players get #impulse_motion ImpulseMotion.Y
execute store result storage impulse_motion: _.macro.PowerZ int 1 run scoreboard players get #impulse_motion ImpulseMotion.Z

data modify storage impulse_motion: _.macro.PowerX set compute default float {type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.macro.PowerX"},{type:"storage",storage:"impulse_motion:",path:"_.in.multiplier.in_water"}]}
data modify storage impulse_motion: _.macro.PowerY set compute default float {type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.macro.PowerY"},{type:"storage",storage:"impulse_motion:",path:"_.in.multiplier.in_water"}]}
data modify storage impulse_motion: _.macro.PowerZ set compute default float {type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.macro.PowerZ"},{type:"storage",storage:"impulse_motion:",path:"_.in.multiplier.in_water"}]}

execute store result score #impulse_motion ImpulseMotion.X run data get storage impulse_motion: _.macro.PowerX 1
execute store result score #impulse_motion ImpulseMotion.Y run data get storage impulse_motion: _.macro.PowerY 1
execute store result score #impulse_motion ImpulseMotion.Z run data get storage impulse_motion: _.macro.PowerZ 1

