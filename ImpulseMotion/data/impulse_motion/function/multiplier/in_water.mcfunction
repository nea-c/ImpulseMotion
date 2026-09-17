

execute store result score #impulse_motion ImpulseMotion.X run compute default float {type:"mul",inputs:[{type:"from_int",input:{type:"score",score:"ImpulseMotion.X",target:{type:"fixed",name:"#impulse_motion"}}},{type:"storage",storage:"impulse_motion:",path:"_.in.multiplier.in_water"}]} 1
execute store result score #impulse_motion ImpulseMotion.Y run compute default float {type:"mul",inputs:[{type:"from_int",input:{type:"score",score:"ImpulseMotion.Y",target:{type:"fixed",name:"#impulse_motion"}}},{type:"storage",storage:"impulse_motion:",path:"_.in.multiplier.in_water"}]} 1
execute store result score #impulse_motion ImpulseMotion.Z run compute default float {type:"mul",inputs:[{type:"from_int",input:{type:"score",score:"ImpulseMotion.Z",target:{type:"fixed",name:"#impulse_motion"}}},{type:"storage",storage:"impulse_motion:",path:"_.in.multiplier.in_water"}]} 1

