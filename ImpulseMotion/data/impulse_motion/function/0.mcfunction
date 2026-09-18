
## データ記法
# x/y/z : 方向ベクトル成分値 (0.0001単位)
# is_knockback : ノックバック扱いかどうか True/False
# is_looking : 実行時の向きに基づくかどうか True/False
# multiplier.elytra : エリトラ飛行中の場合の付与量を調整 (0.001単位)
# multiplier.in_water : 水中の場合の付与量を調整 (0.001単位)
# multiplier.swim : 泳いでいる場合の付与量を調整 (0.001単位)
# data modify storage impulse_motion: in set value {x:0.0000,y:0.0000,z:0.0000, is_looking:false, is_vehicle_execution:false, is_knockback:false, is_explosion:false, multiplier:{elytra:0.500,swim:0.500,in_water:1.5}}


tag @s add impulse_motion.executer
function impulse_motion:1.call
tag @s remove impulse_motion.executer
