

# 実行者の角度を取得
function impulse_motion:.get_rotation/0
data modify storage impulse_motion: _.RotationA set from storage impulse_motion: _.Rotation

function impulse_motion:.get_rotation/1
data modify storage impulse_motion: _.RotationB set from storage impulse_motion: _.Rotation

# executerがプレイヤーじゃない場合、RotationA[0]をB[0]と同期
execute if data storage impulse_motion: _{executer_is_not_player:true} run data modify storage impulse_motion: _.RotationA[0] set from storage impulse_motion: _.RotationB[0]

# 変換
data modify storage impulse_motion: _.calc.sa set compute default float {type:"sin",input:{type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.RotationA[1]"},0.01745329251994329576923690768489]}}
data modify storage impulse_motion: _.calc.ca set compute default float {type:"cos",input:{type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.RotationA[1]"},0.01745329251994329576923690768489]}}
data modify storage impulse_motion: _.calc.sb set compute default float {type:"sin",input:{type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.RotationB[1]"},0.01745329251994329576923690768489]}}
data modify storage impulse_motion: _.calc.cb set compute default float {type:"cos",input:{type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.RotationB[1]"},0.01745329251994329576923690768489]}}

data modify storage impulse_motion: _.calc.sd set compute default float {type:"sin",input:{type:"mul",inputs:[{type:"sub",left:{type:"storage",storage:"impulse_motion:",path:"_.RotationA[0]"},right:{type:"storage",storage:"impulse_motion:",path:"_.RotationB[0]"}},0.01745329251994329576923690768489]}}
data modify storage impulse_motion: _.calc.cd set compute default float {type:"cos",input:{type:"mul",inputs:[{type:"sub",left:{type:"storage",storage:"impulse_motion:",path:"_.RotationA[0]"},right:{type:"storage",storage:"impulse_motion:",path:"_.RotationB[0]"}},0.01745329251994329576923690768489]}}


# tmpA = inY * sa + inZ * ca
data modify storage impulse_motion: _.calc.tmpA set compute default float {type:"add",inputs:[\
  {type:"mul",inputs:[{type:"from_int",input:{type:"score",score:"ImpulseMotion.Y",target:{type:"fixed",name:"#impulse_motion"}}},{type:"storage",storage:"impulse_motion:",path:"_.calc.sa"}]},\
  {type:"mul",inputs:[{type:"from_int",input:{type:"score",score:"ImpulseMotion.Z",target:{type:"fixed",name:"#impulse_motion"}}},{type:"storage",storage:"impulse_motion:",path:"_.calc.ca"}]},\
]}
# tmpB = inX * sd + tmpA * cd
data modify storage impulse_motion: _.calc.tmpB set compute default float {type:"add",inputs:[\
  {type:"mul",inputs:[{type:"from_int",input:{type:"score",score:"ImpulseMotion.X",target:{type:"fixed",name:"#impulse_motion"}}},{type:"storage",storage:"impulse_motion:",path:"_.calc.sd"}]},\
  {type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.calc.tmpA"},{type:"storage",storage:"impulse_motion:",path:"_.calc.cd"}]},\
]}
# tmpY = inY * ca - inZ * sa
data modify storage impulse_motion: _.calc.tmpY set compute default float {type:"sub",\
  left: {type:"mul",inputs:[{type:"from_int",input:{type:"score",score:"ImpulseMotion.Y",target:{type:"fixed",name:"#impulse_motion"}}},{type:"storage",storage:"impulse_motion:",path:"_.calc.ca"}]},\
  right: {type:"mul",inputs:[{type:"from_int",input:{type:"score",score:"ImpulseMotion.Z",target:{type:"fixed",name:"#impulse_motion"}}},{type:"storage",storage:"impulse_motion:",path:"_.calc.sa"}]},\
}

# X = inX * cd - tmpA * sd
data modify storage impulse_motion: _.calc.x set compute default float {type:"sub",\
  left: {type:"mul",inputs:[{type:"from_int",input:{type:"score",score:"ImpulseMotion.X",target:{type:"fixed",name:"#impulse_motion"}}},{type:"storage",storage:"impulse_motion:",path:"_.calc.cd"}]},\
  right: {type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.calc.tmpA"},{type:"storage",storage:"impulse_motion:",path:"_.calc.sd"}]},\
}
# Y = tmpY * cb + tmpB * sb
data modify storage impulse_motion: _.calc.y set compute default float {type:"add",inputs:[\
  {type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.calc.tmpY"},{type:"storage",storage:"impulse_motion:",path:"_.calc.cb"}]},\
  {type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.calc.tmpB"},{type:"storage",storage:"impulse_motion:",path:"_.calc.sb"}]},\
]}
# Z = tmpB * cb - tmpY * sb
data modify storage impulse_motion: _.calc.z set compute default float {type:"sub",\
  left: {type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.calc.tmpB"},{type:"storage",storage:"impulse_motion:",path:"_.calc.cb"}]},\
  right: {type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.calc.tmpY"},{type:"storage",storage:"impulse_motion:",path:"_.calc.sb"}]},\
}

# 計算後の値を取得
execute store result score #impulse_motion ImpulseMotion.X run data get storage impulse_motion: _.calc.x 1
execute store result score #impulse_motion ImpulseMotion.Y run data get storage impulse_motion: _.calc.y 1
execute store result score #impulse_motion ImpulseMotion.Z run data get storage impulse_motion: _.calc.z 1
