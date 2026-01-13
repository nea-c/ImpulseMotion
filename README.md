# PlayerImpulse
このデータパックは、ひろばお氏の[PlayerMotion](https://github.com/Hirobao1/CustomEnchant_PlayerMotion)を自分用に改編したものです。

## 対応バージョン
Minecraft JE 1.21.11


## 使い方

`player_impulse: in`にデータをセットしてfunctionを実行！

### 例：実行時の向きでMotionを代入する
```
data modify storage player_impulse: in set value {x:0.0000,y:0.0000,z:1.0000, is_looking:true}
execute rotated ~ 20 run function #player_impulse:
```
### 例：XYZの方向でMotionを代入する
```
data modify storage player_impulse: in set value {x:1.0000,y:10.0000,z:1.0000}
function #player_impulse:
```

#### inに記載できるデータ一覧
 - x / y / z
> 方向ベクトル成分値 (0.0001単位)
 - is_knockback
> ノックバック扱いかどうか True/False
 - is_looking
> 実行時の向きに基づく付与かどうか True/False
 - is_elytra_suppression
> エリトラ飛行中の場合に付与量を調整するかどうか True/False

