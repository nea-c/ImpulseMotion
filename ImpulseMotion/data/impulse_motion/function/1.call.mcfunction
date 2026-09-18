

# ストレージを初期化
data modify storage impulse_motion: _ set value {in:{x:0.0000,y:0.0000,z:0.0000, is_looking:false, is_vehicle_execution:true, is_knockback:false, is_explosion:false, multiplier:{elytra:0.500,swim:0.500,in_water:1.5}}}

# 入力値を受け取る
data modify storage impulse_motion: _.in merge from storage impulse_motion: in



# スペクテイターのプレイヤーなら中断
execute if entity @s[type=player,gamemode=spectator] run \
  return fail
# is_vehicle_executionがtrueの時、何かに乗っているなら実行者を下へ
execute if data storage impulse_motion: _.in{is_vehicle_execution:true} if predicate impulse_motion:has_vehicle on vehicle run \
  return run function impulse_motion:1.call
# is_vehicle_executionがfalseの時、何かに乗っているなら中断
execute if data storage impulse_motion: _.in{is_vehicle_execution:false} if predicate impulse_motion:has_vehicle on vehicle run \
  return fail
# クリエイティブのプレイヤーで、かつクリエ飛行中なら中断
execute if entity @s[type=player,gamemode=creative] \
  if predicate {type:"entity_properties",entity:"this",predicate:{flags:{is_flying:1b,is_fall_flying:0b}}} run \
    return fail



# 爆発扱いなら耐性値で調整
execute if data storage impulse_motion: _.in{is_explosion:true} run function impulse_motion:2.explosion

# ノックバック扱いなら耐性値で調整
execute if data storage impulse_motion: _.in{is_knockback:true} run function impulse_motion:2.knockback


# is_lookingがtrueなら向きにMotion付与
execute if data storage impulse_motion: _.in{is_looking:true} run \
  return run function impulse_motion:3.looking


# 向きに関係なくXYZ軸にMotion付与
function impulse_motion:3.xyz
