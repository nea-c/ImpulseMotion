

# 実行者の角度を取得
execute rotated as @s in neac: as 1604-1604-1604-1604-1604 run function impulse_motion:.get_rotation

# 角度を使用してローカル座標系に変換
data modify storage impulse_motion: _.calc.sx set compute default float {type:"sin",input:{type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.Rotation[1]"},0.01745329251994329576923690768489]}}
data modify storage impulse_motion: _.calc.cx set compute default float {type:"cos",input:{type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.Rotation[1]"},0.01745329251994329576923690768489]}}
data modify storage impulse_motion: _.calc.sy set compute default float {type:"sin",input:{type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.Rotation[0]"},0.01745329251994329576923690768489]}}
data modify storage impulse_motion: _.calc.cy set compute default float {type:"cos",input:{type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.Rotation[0]"},0.01745329251994329576923690768489]}}

# tmp = -inX * sy + inZ * cy
data modify storage impulse_motion: _.calc.tmp set compute default float {type:"add",inputs:[\
  {type:"mul",inputs:[{type:"negate",input:{type:"storage",storage:"impulse_motion:",path:"_.in.x"}},{type:"storage",storage:"impulse_motion:",path:"_.calc.sy"}]},\
  {type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.in.z"},{type:"storage",storage:"impulse_motion:",path:"_.calc.cy"}]},\
]}

# X = inX * cy + inZ * sy
data modify storage impulse_motion: _.calc.x set compute default float {type:"add",inputs:[\
  {type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.in.x"},{type:"storage",storage:"impulse_motion:",path:"_.calc.cy"}]},\
  {type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.in.z"},{type:"storage",storage:"impulse_motion:",path:"_.calc.sy"}]},\
]}
# Y = inY * cx + tmp * sx
data modify storage impulse_motion: _.calc.y set compute default float {type:"add",inputs:[\
  {type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.in.y"},{type:"storage",storage:"impulse_motion:",path:"_.calc.cx"}]},\
  {type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.calc.tmp"},{type:"storage",storage:"impulse_motion:",path:"_.calc.sx"}]},\
]}
# Z = tmp * cx - inY * sx
data modify storage impulse_motion: _.calc.z set compute default float {type:"sub",\
  left: {type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.calc.tmp"},{type:"storage",storage:"impulse_motion:",path:"_.calc.cx"}]},\
  right: {type:"mul",inputs:[{type:"storage",storage:"impulse_motion:",path:"_.in.y"},{type:"storage",storage:"impulse_motion:",path:"_.calc.sx"}]},\
}


# 計算後の値を取得
execute store result score #impulse_motion ImpulseMotion.X run data get storage impulse_motion: _.calc.x 10000
execute store result score #impulse_motion ImpulseMotion.Y run data get storage impulse_motion: _.calc.y 10000
execute store result score #impulse_motion ImpulseMotion.Z run data get storage impulse_motion: _.calc.z 10000


function impulse_motion:3.motion_set

