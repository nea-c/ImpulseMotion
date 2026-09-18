

# 実行者のスコアを加算
scoreboard players operation #impulse_motion ImpulseMotion.X += @s ImpulseMotion.X
scoreboard players operation #impulse_motion ImpulseMotion.Y += @s ImpulseMotion.Y
scoreboard players operation #impulse_motion ImpulseMotion.Z += @s ImpulseMotion.Z


# 実行者に保持
scoreboard players operation @s ImpulseMotion.X = #impulse_motion ImpulseMotion.X
scoreboard players operation @s ImpulseMotion.Y = #impulse_motion ImpulseMotion.Y
scoreboard players operation @s ImpulseMotion.Z = #impulse_motion ImpulseMotion.Z



# エリトラでの飛行中 / Z成分が正数 のとき、functionを実行して付与量を調整
execute if predicate {type:"entity_properties",entity:"this",predicate:{flags:{is_fall_flying:true}}} if score #impulse_motion ImpulseMotion.Z matches 1.. run function impulse_motion:multiplier/elytra

# 水中 のとき、functionを実行して付与量を調整
execute if predicate {type:"entity_properties",entity:"this",predicate:{flags:{is_in_water:true}}} run function impulse_motion:multiplier/in_water

# 泳いでいる / Z成分が正数 のとき、functionを実行して付与量を調整
execute if predicate {type:"entity_properties",entity:"this",predicate:{flags:{is_swimming:true}}} if score #impulse_motion ImpulseMotion.Z matches 1.. run function impulse_motion:multiplier/swim



# アイテムがない場合付与
execute unless items entity @s armor.body * run item replace entity @s armor.body with stone[equippable={slot:"body",equip_sound:"entity.cod.ambient"},enchantments={binding_curse:1,vanishing_curse:1}]

# 初期値
data modify storage impulse_motion: _.bits set value {\
  "x31":false,"x30":false,"x29":false,"x28":false,"x27":false,"x26":false,"x25":false,"x24":false,"x23":false,"x22":false,"x21":false,"x20":false,"x19":false,"x18":false,"x17":false,"x16":false,"x15":false,"x14":false,"x13":false,"x12":false,"x11":false,"x10":false,"x9":false,"x8":false,"x7":false,"x6":false,"x5":false,"x4":false,"x3":false,"x2":false,"x1":false,"x0":false,\
  "y31":false,"y30":false,"y29":false,"y28":false,"y27":false,"y26":false,"y25":false,"y24":false,"y23":false,"y22":false,"y21":false,"y20":false,"y19":false,"y18":false,"y17":false,"y16":false,"y15":false,"y14":false,"y13":false,"y12":false,"y11":false,"y10":false,"y9":false,"y8":false,"y7":false,"y6":false,"y5":false,"y4":false,"y3":false,"y2":false,"y1":false,"y0":false,\
  "z31":false,"z30":false,"z29":false,"z28":false,"z27":false,"z26":false,"z25":false,"z24":false,"z23":false,"z22":false,"z21":false,"z20":false,"z19":false,"z18":false,"z17":false,"z16":false,"z15":false,"z14":false,"z13":false,"z12":false,"z11":false,"z10":false,"z9":false,"z8":false,"z7":false,"z6":false,"z5":false,"z4":false,"z3":false,"z2":false,"z1":false,"z0":false,\
}

# 値を2進数分解
function impulse_motion:store/x
function impulse_motion:store/y
function impulse_motion:store/z



# リセット
scoreboard players reset #impulse_motion




# エンチャント付与
item modify entity @s armor.body [\
  {type:"set_enchantments",enchantments:{"impulse_motion:apply":1}},\
  {type:"copy_custom_data",source:{type:"storage",source:"impulse_motion:"},ops:[{source:"_.bits",target:"impulse_motion",op:"replace"}]}\
]


