

# 自分がexecuterじゃないなら上へ移動
execute if entity @s[tag=!impulse_motion.executer] on passengers run \
  return run function impulse_motion:.get_rotation/3.executer

execute if entity @s[type=!player] run data modify storage impulse_motion: _.executer_is_not_player set value true
execute rotated as @s run function impulse_motion:.get_rotation/1.execution


