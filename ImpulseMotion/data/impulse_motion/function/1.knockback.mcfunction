

# ノックバック耐性を取得(1%刻み)
  execute store result score #impulse_motion.is_knockback.resist neac_value run attribute @s knockback_resistance get -100
  scoreboard players add #impulse_motion.is_knockback.resist neac_value 100
  execute if score #impulse_motion.is_knockback.resist neac_value matches ..-1 run scoreboard players set #impulse_motion.is_knockback.resist neac_value 0
  execute if score #impulse_motion.is_knockback.resist neac_value matches 101.. run scoreboard players set #impulse_motion.is_knockback.resist neac_value 100

# それぞれの項目に要素が入っている時、ノックバック耐性の倍率を適用
  # in.x
    execute if data storage impulse_motion: _.in.x store result score #impulse_motion.is_knockback.amount neac_value run data get storage impulse_motion: _.in.x 10000
    execute if data storage impulse_motion: _.in.x store result storage impulse_motion: _.in.x double 0.000001 run scoreboard players operation #impulse_motion.is_knockback.amount neac_value *= #impulse_motion.is_knockback.resist neac_value
  # in.y
    execute if data storage impulse_motion: _.in.y store result score #impulse_motion.is_knockback.amount neac_value run data get storage impulse_motion: _.in.y 10000
    execute if data storage impulse_motion: _.in.y store result storage impulse_motion: _.in.y double 0.000001 run scoreboard players operation #impulse_motion.is_knockback.amount neac_value *= #impulse_motion.is_knockback.resist neac_value
  # in.z
    execute if data storage impulse_motion: _.in.z store result score #impulse_motion.is_knockback.amount neac_value run data get storage impulse_motion: _.in.z 10000
    execute if data storage impulse_motion: _.in.z store result storage impulse_motion: _.in.z double 0.000001 run scoreboard players operation #impulse_motion.is_knockback.amount neac_value *= #impulse_motion.is_knockback.resist neac_value

# スコアリセット
  scoreboard players reset #impulse_motion.is_knockback.amount
  scoreboard players reset #impulse_motion.is_knockback.resist