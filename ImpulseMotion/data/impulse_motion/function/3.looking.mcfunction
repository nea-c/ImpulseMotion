
# 実行角度を取得
function impulse_motion:.get_rotation/1.execution


### グローバル座標系に変換

data modify storage impulse_motion: _.calc.sx set compute default float {type:"sin",input:{type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.Rotation[1]"},0.01745329251994329576923690768489]}}
data modify storage impulse_motion: _.calc.cx set compute default float {type:"cos",input:{type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.Rotation[1]"},0.01745329251994329576923690768489]}}
data modify storage impulse_motion: _.calc.sy set compute default float {type:"sin",input:{type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.Rotation[0]"},0.01745329251994329576923690768489]}}
data modify storage impulse_motion: _.calc.cy set compute default float {type:"cos",input:{type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.Rotation[0]"},0.01745329251994329576923690768489]}}

# tmp = inY * sx + inZ * cx
data modify storage impulse_motion: _.calc.tmp set compute default float {type:"add",inputs:[\
  {type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.in.y"},{type:"storage",storage:"impulse_motion:",path:"_.calc.sx"}]},\
  {type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.in.z"},{type:"storage",storage:"impulse_motion:",path:"_.calc.cx"}]},\
]}

# X = inX * cy - tmp * sy
data modify storage impulse_motion: _.calc.x set compute default float {type:"sub",\
  left: {type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.in.x"},{type:"storage",storage:"impulse_motion:",path:"_.calc.cy"}]},\
  right: {type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.calc.tmp"},{type:"storage",storage:"impulse_motion:",path:"_.calc.sy"}]},\
}
# Y = inY * cx - inZ * sx
data modify storage impulse_motion: _.calc.y set compute default float {type:"sub",\
  left: {type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.in.y"},{type:"storage",storage:"impulse_motion:",path:"_.calc.cx"}]},\
  right: {type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.in.z"},{type:"storage",storage:"impulse_motion:",path:"_.calc.sx"}]},\
}
# Z = inX * sy + tmp * cy
data modify storage impulse_motion: _.calc.z set compute default float {type:"add",inputs:[\
  {type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.in.x"},{type:"storage",storage:"impulse_motion:",path:"_.calc.sy"}]},\
  {type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.calc.tmp"},{type:"storage",storage:"impulse_motion:",path:"_.calc.cy"}]},\
]}


# 計算後の値でinを上書き
data modify storage impulse_motion: _.in.x set from storage impulse_motion: _.calc.x
data modify storage impulse_motion: _.in.y set from storage impulse_motion: _.calc.y
data modify storage impulse_motion: _.in.z set from storage impulse_motion: _.calc.z


function impulse_motion:4.motion_set

