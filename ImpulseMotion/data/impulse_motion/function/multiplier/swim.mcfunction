

execute store result score #impulse_motion ImpulseMotion.Z run compute default float {type:"round",input:{type:"mul",inputs:[{type:"from_int",input:{type:"score",score:"ImpulseMotion.Z",target:{type:"fixed",name:"#impulse_motion"}}},{type:"storage",storage:"impulse_motion:",path:"_.in.multiplier.swim"}]}} 1

