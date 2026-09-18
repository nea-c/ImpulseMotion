

data modify storage impulse_motion: _.bits set value {}
item modify entity @s armor.body [\
  {type:"set_enchantments",enchantments:{"impulse_motion:apply":0}},\
  {type:"copy_custom_data",source:{type:"storage",source:"impulse_motion:"},ops:[{source:"_.bits",target:"impulse_motion",op:"replace"}]}\
]


# スコアリセット
scoreboard players reset @s ImpulseMotion.X
scoreboard players reset @s ImpulseMotion.Y
scoreboard players reset @s ImpulseMotion.Z
