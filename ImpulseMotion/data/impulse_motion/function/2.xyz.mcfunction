


# 入力値の取得
execute store result score #impulse_motion PlayerImpulse.X run data get storage impulse_motion: _.in.x 10000
execute store result score #impulse_motion PlayerImpulse.Y run data get storage impulse_motion: _.in.y 10000
execute store result score #impulse_motion PlayerImpulse.Z run data get storage impulse_motion: _.in.z 10000

# 値の修正
execute if score #impulse_motion PlayerImpulse.X matches 1000001.. run scoreboard players set #impulse_motion PlayerImpulse.X 1000000
execute if score #impulse_motion PlayerImpulse.X matches ..-1000001 run scoreboard players set #impulse_motion PlayerImpulse.X -1000000
execute if score #impulse_motion PlayerImpulse.Y matches 1000001.. run scoreboard players set #impulse_motion PlayerImpulse.Y 1000000
execute if score #impulse_motion PlayerImpulse.Y matches ..-1000001 run scoreboard players set #impulse_motion PlayerImpulse.Y -1000000
execute if score #impulse_motion PlayerImpulse.Z matches 1000001.. run scoreboard players set #impulse_motion PlayerImpulse.Z 1000000
execute if score #impulse_motion PlayerImpulse.Z matches ..-1000001 run scoreboard players set #impulse_motion PlayerImpulse.Z -100000


function impulse_motion:3.motion_set

