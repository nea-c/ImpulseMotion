# ImpulseMotion
このデータパックは、ひろばお氏の[PlayerMotion](https://github.com/Hirobao1/CustomEnchant_PlayerMotion)を参考に自分用として作成したものです。

大規模な内部処理の変更により、使用感・同一tick動作での挙動が異なります。


## 動作要件
Minecraft JE 1.21.11


## 使用方法

`impulse_motion: in`にデータをセットしてfunctionを実行！

### 例1：実行方向で
```
data modify storage impulse_motion: in set value {x:0.0000,y:0.0000,z:1.0000, is_looking:true}
execute rotated ~ -20 run function #impulse_motion:
```
### 例2：XYZで
```
data modify storage impulse_motion: in set value {x:1.0000,y:10.0000,z:1.0000}
function #impulse_motion:
```

#### inに記載できるデータ一覧
 - x / y / z
> 方向ベクトル成分値 (0.0001単位)
 - is_knockback
> ノックバック扱いかどうか True/False
 - is_looking
> 実行時の向きに基づくかどうか True/False
 - multiplier.elytra
> エリトラ飛行中の場合の付与量を調整 (0.001単位)
 - multiplier.in_water
> 水中の場合の付与量を調整 (0.001単位)
 - multiplier.swim
> 泳いでいる場合の付与量を調整 (0.001単位)

