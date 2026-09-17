
## データ記法
# x/y/z : 方向ベクトル成分値 (0.0001単位)
# is_knockback : ノックバック扱いかどうか True/False
# is_looking : 実行時の向きに基づくかどうか True/False
# multiplier.elytra : エリトラ飛行中の場合の付与量を調整 (0.001単位)
# multiplier.in_water : 水中の場合の付与量を調整 (0.001単位)
# multiplier.swim : 泳いでいる場合の付与量を調整 (0.001単位)
# data modify storage impulse_motion: in set value {x:0.0000,y:0.0000,z:0.0000, is_knockback:false,is_looking:false,multiplier:{elytra:0.500,swim:0.500,in_water:1.5}}



# スペクテイターのプレイヤーなら中断
execute if entity @s[type=player,gamemode=spectator] run \
  return fail
# クリエイティブのプレイヤーで、かつクリエ飛行中なら中断
execute if entity @s[type=player,gamemode=creative] \
  if predicate {type:"entity_properties",entity:"this",predicate:{flags:{is_flying:1b,is_fall_flying:0b}}} run \
    return fail



# ストレージを初期化
data modify storage impulse_motion: _ set value {in:{x:0.0000,y:0.0000,z:0.0000, is_knockback:false,is_explosion:false,is_looking:false,multiplier:{elytra:0.500,swim:0.500,in_water:1.5}} ,macro:{x1:0,x2:0,x3:0,y1:0,y2:0,y3:0,z1:0,z2:0,z3:0, x_sign:"+",y_sign:"+",z_sign:"+"}}

# 入力値を受け取る
data modify storage impulse_motion: _.in merge from storage impulse_motion: in



# 爆発扱いなら耐性値で調整
execute if data storage impulse_motion: _.in{is_explosion:true} run function impulse_motion:1.explosion

# ノックバック扱いなら耐性値で調整
execute if data storage impulse_motion: _.in{is_knockback:true} run function impulse_motion:1.knockback


# is_lookingがtrueなら向きにMotion付与
execute if data storage impulse_motion: _.in{is_looking:true} run \
  return run function impulse_motion:2.looking


# 向きに関係なくXYZ軸にMotion付与
function impulse_motion:2.xyz
