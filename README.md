# ImpulseMotion


このデータパックは、ひろばお氏の[PlayerMotion](https://github.com/Hirobao1/CustomEnchant_PlayerMotion)を参考に自分用として作成したものです。

大規模な内部処理の変更により、使用感・同一tick動作での挙動が異なります。

`apply_impulse`が抱えていた問題が26.3で修正されたため、アーカイブを解除・挙動を26.3用に調整しました。


## 最新

r3


## 動作要件
Minecraft JE 26.3~


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

### inに記載できるデータ一覧
 - #### x / y / z
> FLOAT (0.0001単位)

方向ベクトル


 - #### is_looking
> BOOL

実行時の向きに基づくかどうか  
デフォルト: False


 - #### is_vehicle_execution
> BOOL

vehicleが存在するときに動作するかどうか  
デフォルト: FALSE


 - #### is_knockback
> BOOL

ノックバック扱いかどうか  
デフォルト: False


 - #### is_explosion
> BOOL

爆発扱いかどうか  
デフォルト: False


 - #### multiplier.elytra
> FLOAT

エリトラ飛行中の場合の付与量を調整  
デフォルト: 0.5


 - #### multiplier.in_water
> FLOAT

水中の場合の付与量を調整  
デフォルト: 0.5


 - #### multiplier.swim
> FLOAT

泳いでいる場合の付与量を調整  
デフォルト: 1.5


## ライセンス

[MIT License](https://github.com/nea-c/ImpulseMotion/blob/master/LICENSE) に基づく

## 更新履歴

* r3
  * ローカル座標系からグローバル座標系に変換する挙動を復活
    * 消しちゃいけなかった()
  * is_vehicle_executionのデフォルトをFALSEに変更

* r2
  * 対応バージョンをMCJE 26.3~に変更
  * 騎乗中判定で下のエンティティに効果を適応する仕様を追加
  * is_explosionを追加
  * is_vehicle_executionを追加
  * ローカル座標系からグローバル座標系に変換する挙動を削除
  * 上限下限を削除
    * オーバーフローの可能性がありますが、入力値側で対策してください  
    (実際そうそうないと思う。`1000.0000`とかを入力値にするってなんだよ)
  * 一部計算処理をcomputeに置き換え
    * 1000倍の値で掛け算して1/1000にするとかいう割とカスの操作を削除したので、オーバーフローが起こりにくくなっているはず
  * 使用スロットをarmor.bodyに変更
  * armor.bodyを使用するエンティティの時は、armor.feetを使用するように変更

* r1
  * 初版