
## データ記法
# x/y/z : 方向ベクトル成分値 (0.0001単位)
# is_knockback : ノックバック扱いかどうか True/False
# is_looking : 実行時の向きに基づくかどうか True/False
# is_elytra_suppression : エリトラ飛行中の場合に付与量を調整するかどうか True/False
# data modify storage impulse_motion: in set value {x:0.0000,y:0.0000,z:0.0000, is_knockback:false,is_looking:false,is_elytra_suppression:true}



# プレイヤーで、かつスペクテイターなら中断
execute if entity @s[type=player,gamemode=spectator] run \
  return fail
# プレイヤーで、かつ飛行判定のクリエイティブ、かつ目の高さから足元が近くないなら中断
execute if entity @s[type=player,gamemode=creative,predicate=impulse_motion:is_flying] at @s \
  anchored eyes positioned ^ ^ ^ unless entity @s[distance=..0.5] run \
    return fail


# ストレージを初期化
data modify storage impulse_motion: _ set value {in:{x:0.0000,y:0.0000,z:0.0000, is_knockback:false,is_looking:false,is_elytra_suppression:true} ,macro:{x1:0,x2:0,x3:0,y1:0,y2:0,y3:0,z1:0,z2:0,z3:0, x_sign:"+",y_sign:"+",z_sign:"+"}}

# 入力値を受け取る
data modify storage impulse_motion: _.in merge from storage impulse_motion: in


# ノックバック扱いなら耐性値で調整
execute if data storage impulse_motion: _.in{is_knockback:true} run function impulse_motion:1.knockback


# is_lookingがtrueなら向きにMotion付与
execute if data storage impulse_motion: _.in{is_looking:true} run \
  return run function impulse_motion:2.looking


# 向きに関係なくXYZ軸にMotion付与
function impulse_motion:2.xyz
