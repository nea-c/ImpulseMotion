

execute store result storage impulse_motion: _.macro.PowerX int 1 run scoreboard players get #impulse_motion ImpulseMotion.X
execute store result storage impulse_motion: _.macro.PowerY int 1 run scoreboard players get #impulse_motion ImpulseMotion.Y
execute store result storage impulse_motion: _.macro.PowerZ int 1 run scoreboard players get #impulse_motion ImpulseMotion.Z

# 絶対座標ベクトルへ変換
execute rotated as @s in neac: positioned 0.0 0.0 0.0 as 1604-1604-1604-1604-1604 run function impulse_motion:local_to_world/0


# 実行者のスコアを加算
scoreboard players operation #impulse_motion ImpulseMotion.X += @s ImpulseMotion.X
scoreboard players operation #impulse_motion ImpulseMotion.Y += @s ImpulseMotion.Y
scoreboard players operation #impulse_motion ImpulseMotion.Z += @s ImpulseMotion.Z


execute if score #impulse_motion ImpulseMotion.X matches 1000001.. run scoreboard players set #impulse_motion ImpulseMotion.X 1000000
execute if score #impulse_motion ImpulseMotion.X matches ..-1000001 run scoreboard players set #impulse_motion ImpulseMotion.X -1000000
execute if score #impulse_motion ImpulseMotion.Y matches 1000001.. run scoreboard players set #impulse_motion ImpulseMotion.Y 1000000
execute if score #impulse_motion ImpulseMotion.Y matches ..-1000001 run scoreboard players set #impulse_motion ImpulseMotion.Y -1000000
execute if score #impulse_motion ImpulseMotion.Z matches 1000001.. run scoreboard players set #impulse_motion ImpulseMotion.Z 1000000
execute if score #impulse_motion ImpulseMotion.Z matches ..-1000001 run scoreboard players set #impulse_motion ImpulseMotion.Z -100000


# 実行者に保持
scoreboard players operation @s ImpulseMotion.X = #impulse_motion ImpulseMotion.X
scoreboard players operation @s ImpulseMotion.Y = #impulse_motion ImpulseMotion.Y
scoreboard players operation @s ImpulseMotion.Z = #impulse_motion ImpulseMotion.Z


# is_elytra_suppressionがtrue / エリトラでの飛行中 / Z成分が正数
# ↑を全て満たすとき、Z成分を半減
execute if data storage impulse_motion: _.in{is_elytra_suppression:true} \
  if predicate {condition:"entity_properties",entity:"this",predicate:{flags:{is_fall_flying:1b}}} \
    if score #impulse_motion ImpulseMotion.Z matches 1.. \
      run scoreboard players operation #impulse_motion ImpulseMotion.Z /= #global 2


# 値を取得 ( x1:1, x2:1/100, x3:1/10000 )
execute if score #impulse_motion ImpulseMotion.X matches ..-1 run data modify storage impulse_motion: _.macro.x_sign set value "-"
execute if data storage impulse_motion: _.macro{x_sign:"-"} run scoreboard players operation #impulse_motion ImpulseMotion.X *= #global -1
execute store result storage impulse_motion: _.macro.x3 int 0.0001 run scoreboard players operation #impulse_motion neac_value = #impulse_motion ImpulseMotion.X
execute store result storage impulse_motion: _.macro.x2 int 0.01 run scoreboard players operation #impulse_motion neac_value %= #global 10000
execute store result storage impulse_motion: _.macro.x1 int 1 run scoreboard players operation #impulse_motion neac_value %= #global 100

execute if score #impulse_motion ImpulseMotion.Y matches ..-1 run data modify storage impulse_motion: _.macro.y_sign set value "-"
execute if data storage impulse_motion: _.macro{y_sign:"-"} run scoreboard players operation #impulse_motion ImpulseMotion.Y *= #global -1
execute store result storage impulse_motion: _.macro.y3 int 0.0001 run scoreboard players operation #impulse_motion neac_value = #impulse_motion ImpulseMotion.Y
execute store result storage impulse_motion: _.macro.y2 int 0.01 run scoreboard players operation #impulse_motion neac_value %= #global 10000
execute store result storage impulse_motion: _.macro.y1 int 1 run scoreboard players operation #impulse_motion neac_value %= #global 100

execute if score #impulse_motion ImpulseMotion.Z matches ..-1 run data modify storage impulse_motion: _.macro.z_sign set value "-"
execute if data storage impulse_motion: _.macro{z_sign:"-"} run scoreboard players operation #impulse_motion ImpulseMotion.Z *= #global -1
execute store result storage impulse_motion: _.macro.z3 int 0.0001 run scoreboard players operation #impulse_motion neac_value = #impulse_motion ImpulseMotion.Z
execute store result storage impulse_motion: _.macro.z2 int 0.01 run scoreboard players operation #impulse_motion neac_value %= #global 10000
execute store result storage impulse_motion: _.macro.z1 int 1 run scoreboard players operation #impulse_motion neac_value %= #global 100


# 0なら100にする
execute if data storage impulse_motion: _.macro{x1:0} run data modify storage impulse_motion: _.macro.x1 set value 255


# リセット
scoreboard players reset #impulse_motion



# saddleがない場合
execute unless items entity @s saddle * run item replace entity @s saddle with saddle[equippable={slot:saddle,equip_sound:"entity.cod.ambient"},enchantments={binding_curse:1,vanishing_curse:1}]



item modify entity @s saddle {function:"set_custom_data", tag: {impulse_motion.x_sign:"+",impulse_motion.y_sign:"+",impulse_motion.z_sign:"+"}}
execute if data storage impulse_motion: _.macro{x_sign:"-"} run item modify entity @s saddle {function:"set_custom_data", tag: {impulse_motion.x_sign:"-"}}
execute if data storage impulse_motion: _.macro{y_sign:"-"} run item modify entity @s saddle {function:"set_custom_data", tag: {impulse_motion.y_sign:"-"}}
execute if data storage impulse_motion: _.macro{z_sign:"-"} run item modify entity @s saddle {function:"set_custom_data", tag: {impulse_motion.z_sign:"-"}}


function impulse_motion:4.enchant_set with storage impulse_motion: _.macro

