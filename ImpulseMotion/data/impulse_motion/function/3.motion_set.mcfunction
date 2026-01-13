

execute store result storage impulse_motion: _.macro.PowerX int 1 run scoreboard players get #impulse_motion PlayerImpulse.X
execute store result storage impulse_motion: _.macro.PowerY int 1 run scoreboard players get #impulse_motion PlayerImpulse.Y
execute store result storage impulse_motion: _.macro.PowerZ int 1 run scoreboard players get #impulse_motion PlayerImpulse.Z

# 絶対座標ベクトルへ変換
execute rotated as @s in neac: positioned 0.0 0.0 0.0 as 1604-1604-1604-1604-1604 run function impulse_motion:local_to_world/0


# 実行者のスコアを加算
scoreboard players operation #impulse_motion PlayerImpulse.X += @s PlayerImpulse.X
scoreboard players operation #impulse_motion PlayerImpulse.Y += @s PlayerImpulse.Y
scoreboard players operation #impulse_motion PlayerImpulse.Z += @s PlayerImpulse.Z


execute if score #impulse_motion PlayerImpulse.X matches 1000001.. run scoreboard players set #impulse_motion PlayerImpulse.X 1000000
execute if score #impulse_motion PlayerImpulse.X matches ..-1000001 run scoreboard players set #impulse_motion PlayerImpulse.X -1000000
execute if score #impulse_motion PlayerImpulse.Y matches 1000001.. run scoreboard players set #impulse_motion PlayerImpulse.Y 1000000
execute if score #impulse_motion PlayerImpulse.Y matches ..-1000001 run scoreboard players set #impulse_motion PlayerImpulse.Y -1000000
execute if score #impulse_motion PlayerImpulse.Z matches 1000001.. run scoreboard players set #impulse_motion PlayerImpulse.Z 1000000
execute if score #impulse_motion PlayerImpulse.Z matches ..-1000001 run scoreboard players set #impulse_motion PlayerImpulse.Z -100000


# 実行者に保持
scoreboard players operation @s PlayerImpulse.X = #impulse_motion PlayerImpulse.X
scoreboard players operation @s PlayerImpulse.Y = #impulse_motion PlayerImpulse.Y
scoreboard players operation @s PlayerImpulse.Z = #impulse_motion PlayerImpulse.Z


# is_elytra_suppressionがtrue / エリトラでの飛行中 / Z成分が正数
# ↑を全て満たすとき、Z成分を半減
execute if data storage impulse_motion: _.in{is_elytra_suppression:true} \
  if predicate {condition:"entity_properties",entity:"this",predicate:{flags:{is_flying:1b}}} \
    if score #impulse_motion PlayerImpulse.Z matches 1.. \
      run scoreboard players operation #impulse_motion PlayerImpulse.Z /= #global 2


# 値を取得 ( x1:1, x2:1/100, x3:1/10000 )
execute if score #impulse_motion PlayerImpulse.X matches ..-1 run data modify storage impulse_motion: _.macro.x_sign set value "-"
execute if data storage impulse_motion: _.macro{x_sign:"-"} run scoreboard players operation #impulse_motion PlayerImpulse.X *= #global -1
execute store result storage impulse_motion: _.macro.x3 int 0.0001 run scoreboard players operation #impulse_motion neac_value = #impulse_motion PlayerImpulse.X
execute store result storage impulse_motion: _.macro.x2 int 0.01 run scoreboard players operation #impulse_motion neac_value %= #global 10000
execute store result storage impulse_motion: _.macro.x1 int 1 run scoreboard players operation #impulse_motion neac_value %= #global 100

execute if score #impulse_motion PlayerImpulse.Y matches ..-1 run data modify storage impulse_motion: _.macro.y_sign set value "-"
execute if data storage impulse_motion: _.macro{y_sign:"-"} run scoreboard players operation #impulse_motion PlayerImpulse.Y *= #global -1
execute store result storage impulse_motion: _.macro.y3 int 0.0001 run scoreboard players operation #impulse_motion neac_value = #impulse_motion PlayerImpulse.Y
execute store result storage impulse_motion: _.macro.y2 int 0.01 run scoreboard players operation #impulse_motion neac_value %= #global 10000
execute store result storage impulse_motion: _.macro.y1 int 1 run scoreboard players operation #impulse_motion neac_value %= #global 100

execute if score #impulse_motion PlayerImpulse.Z matches ..-1 run data modify storage impulse_motion: _.macro.z_sign set value "-"
execute if data storage impulse_motion: _.macro{z_sign:"-"} run scoreboard players operation #impulse_motion PlayerImpulse.Z *= #global -1
execute store result storage impulse_motion: _.macro.z3 int 0.0001 run scoreboard players operation #impulse_motion neac_value = #impulse_motion PlayerImpulse.Z
execute store result storage impulse_motion: _.macro.z2 int 0.01 run scoreboard players operation #impulse_motion neac_value %= #global 10000
execute store result storage impulse_motion: _.macro.z1 int 1 run scoreboard players operation #impulse_motion neac_value %= #global 100


# 0なら100にする
execute if data storage impulse_motion: _.macro{x1:0} run data modify storage impulse_motion: _.macro.x1 set value 255


# リセット
scoreboard players reset #impulse_motion



# saddleがない場合
execute unless items entity @s saddle * run item replace entity @s saddle with saddle[equippable={slot:saddle,equip_sound:"entity.cod.ambient"},enchantments={binding_curse:1,vanishing_curse:1}]



item modify entity @s saddle {function:"set_custom_data", tag: {x_sign:"+",y_sign:"+",z_sign:"+"}}
execute if data storage impulse_motion: _.macro{x_sign:"-"} run item modify entity @s saddle {function:"set_custom_data", tag: {x_sign:"-"}}
execute if data storage impulse_motion: _.macro{y_sign:"-"} run item modify entity @s saddle {function:"set_custom_data", tag: {y_sign:"-"}}
execute if data storage impulse_motion: _.macro{z_sign:"-"} run item modify entity @s saddle {function:"set_custom_data", tag: {z_sign:"-"}}


function impulse_motion:4.enchant_set with storage impulse_motion: _.macro

