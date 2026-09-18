

# 実行者の角度を取得
execute if data storage impulse_motion: _.in{is_looking:true} run function impulse_motion:.get_rotation/0
execute unless data storage impulse_motion: _.in{is_looking:true} run function impulse_motion:.get_rotation/1

# 角度を使用してローカル座標系に変換
data modify storage impulse_motion: _.calc.sx set compute default float {type:"sin",input:{type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.Rotation[1]"},0.01745329251994329576923690768489]}}
data modify storage impulse_motion: _.calc.cx set compute default float {type:"cos",input:{type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.Rotation[1]"},0.01745329251994329576923690768489]}}
data modify storage impulse_motion: _.calc.sy set compute default float {type:"sin",input:{type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.Rotation[0]"},0.01745329251994329576923690768489]}}
data modify storage impulse_motion: _.calc.cy set compute default float {type:"cos",input:{type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.Rotation[0]"},0.01745329251994329576923690768489]}}

# tmp = inY * sx + inZ * cx
data modify storage impulse_motion: _.calc.tmp set compute default float {type:"add",inputs:[\
  {type:"mul",inputs:[{type:"from_int",input:{type:"score",score:"ImpulseMotion.Y",target:{type:"fixed",name:"#impulse_motion"}}},{type:"storage",storage:"impulse_motion:",path:"_.calc.sx"}]},\
  {type:"mul",inputs:[{type:"from_int",input:{type:"score",score:"ImpulseMotion.Z",target:{type:"fixed",name:"#impulse_motion"}}},{type:"storage",storage:"impulse_motion:",path:"_.calc.cx"}]},\
]}

# X = inX * cy - tmp * sy
data modify storage impulse_motion: _.calc.x set compute default float {type:"sub",\
  left: {type:"mul",inputs:[{type:"from_int",input:{type:"score",score:"ImpulseMotion.X",target:{type:"fixed",name:"#impulse_motion"}}},{type:"storage",storage:"impulse_motion:",path:"_.calc.cy"}]},\
  right: {type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.calc.tmp"},{type:"storage",storage:"impulse_motion:",path:"_.calc.sy"}]},\
}
# Y = inY * cx - inZ * sx
data modify storage impulse_motion: _.calc.y set compute default float {type:"sub",\
  left: {type:"mul",inputs:[{type:"from_int",input:{type:"score",score:"ImpulseMotion.Y",target:{type:"fixed",name:"#impulse_motion"}}},{type:"storage",storage:"impulse_motion:",path:"_.calc.cx"}]},\
  right: {type:"mul",inputs:[{type:"from_int",input:{type:"score",score:"ImpulseMotion.Z",target:{type:"fixed",name:"#impulse_motion"}}},{type:"storage",storage:"impulse_motion:",path:"_.calc.sx"}]},\
}
# Z = inX * sy + tmp * cy
data modify storage impulse_motion: _.calc.z set compute default float {type:"add",inputs:[\
  {type:"mul",inputs:[{type:"from_int",input:{type:"score",score:"ImpulseMotion.X",target:{type:"fixed",name:"#impulse_motion"}}},{type:"storage",storage:"impulse_motion:",path:"_.calc.sy"}]},\
  {type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.calc.tmp"},{type:"storage",storage:"impulse_motion:",path:"_.calc.cy"}]},\
]}


# 計算後の値x0.0001 + 自身のMotion値
data modify storage impulse_motion: _.myMotion set from entity @s Motion

data modify storage impulse_motion: _.Motion set value [0d,0d,0d]
data modify storage impulse_motion: _.Motion[0] set compute default float {type:"add",inputs:[\
  {type:"mul",inputs:[\
    {type:"storage",storage:"impulse_motion:",path:"_.calc.x"}, 0.0001\
  ]},\
  {type:"storage",storage:"impulse_motion:",path:"_.myMotion[0]"}\
]}
data modify storage impulse_motion: _.Motion[1] set compute default float {type:"add",inputs:[\
  {type:"mul",inputs:[\
    {type:"storage",storage:"impulse_motion:",path:"_.calc.y"}, 0.0001\
  ]},\
  {type:"storage",storage:"impulse_motion:",path:"_.myMotion[1]"}\
]}
data modify storage impulse_motion: _.Motion[2] set compute default float {type:"add",inputs:[\
  {type:"mul",inputs:[\
    {type:"storage",storage:"impulse_motion:",path:"_.calc.z"}, 0.0001\
  ]},\
  {type:"storage",storage:"impulse_motion:",path:"_.myMotion[2]"}\
]}
data modify entity @s Motion set from storage impulse_motion: _.Motion
