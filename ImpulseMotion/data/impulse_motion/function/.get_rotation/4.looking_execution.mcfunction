

# 実行者の角度取得
function impulse_motion:.get_rotation/2.as
data modify storage impulse_motion: _.myRotation set from storage impulse_motion: _.Rotation

# executerの角度取得
function impulse_motion:.get_rotation/3.executer
data modify storage impulse_motion: _.executerRotation set from storage impulse_motion: _.Rotation

# 実行角度を取得
function impulse_motion:.get_rotation/1.execution

# executerがプレイヤーじゃないかつ、実行角度とexecuterの角度が同一の場合、実行者の角度Yawをもらう
execute if data storage impulse_motion: _{executer_is_not_player:true} if predicate {type:"float_value_check",value:{type:"sub",\
  left:{type:"storage",storage:"impulse_motion:",path:"_.executerRotation[0]"},\
  right:{type:"storage",storage:"impulse_motion:",path:"_.Rotation[0]"}\
},test:{min:-0.000001,max:0.000001}} run \
  data modify storage impulse_motion: _.Rotation[0] set from storage impulse_motion: _.myRotation[0]
