

## データ記法
# x/y/z : 方向ベクトル成分値 (0.0001単位)
# is_knockback : ノックバック扱いかどうか True/False
# is_looking : 実行時の向きに基づく付与かどうか True/False
# is_elytra_suppression : エリトラ飛行中の場合に付与量を調整するかどうか True/False
# data modify storage player_impulse: in set value {x:0.0000,y:0.0000,z:0.0000, is_knockback:false,is_looking:false,is_elytra_suppression:true}



# ストレージを初期化
data modify storage player_impulse: _ set value {in:{x:0.0000,y:0.0000,z:0.0000, is_knockback:false,is_looking:false,is_elytra_suppression:true} ,macro:{x1:0,x2:0,x3:0,y1:0,y2:0,y3:0,z1:0,z2:0,z3:0, x_sign:"+",y_sign:"+",z_sign:"+"}}

# 入力値を受け取る
data modify storage player_impulse: _.in merge from storage player_impulse: in



# プレイヤーで、かつクリエ/スペクテイターでの飛行中なら中断
execute if entity @s[type=player] run data modify storage player_impulse: _.as set from entity @s
execute if entity @s[type=player] if data storage player_impulse: _.as.abilities{flying:1b} run \
  return fail



# ノックバック扱いなら耐性値で調整
execute if data storage player_impulse: _.in{is_knockback:true} run function player_impulse:1.knockback


# is_lookingがtrueなら向きにMotion付与
execute if data storage player_impulse: _.in{is_looking:true} run \
  return run function player_impulse:2.looking


# 向きに関係なくXYZ軸にMotion付与
function player_impulse:2.xyz
