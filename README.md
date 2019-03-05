# openpose-simple

このプログラムは、[OpenPose](https://github.com/CMU-Perceptual-Computing-Lab/openpose) の実行を簡単にするバッチプログラムです。

インストール、起動オプション、出力結果等は上記URLをご確認ください。

## 機能概要

以下プログラムで使用するためのOpenposeデータを出力します。

 - [miu200521358/3d-pose-baseline-vmd](https://github.com/miu200521358/3d-pose-baseline-vmd)
 - [miu200521358/3dpose_gan_vmd](https://github.com/miu200521358/3dpose_gan_vmd)
 - [miu200521358/FCRN-DepthPrediction-vmd](https://github.com/miu200521358/FCRN-DepthPrediction-vmd)
 - [miu200521358/VMD-3d-pose-baseline-multi](https://github.com/miu200521358/VMD-3d-pose-baseline-multi)


## 準備

詳細は、[Qiita](https://qiita.com/miu200521358/items/d826e9d70853728abc51)を参照して下さい。

## 実行方法

### 映像の場合

1. `Openpose`の実行ディレクトリ(`bin`とかの一個上) に簡易起動バッチをコピーする
    - PortableDemo版： `LICENSE`のファイルがある階層に、バージョン別のバッチをコピー
      - 1.3 … [PortableDemo/1.3/OpenposeVideo.bat](PortableDemo/1.3/OpenposeVideo.bat) 
      - 1.4 … [PortableDemo/1.4/OpenposeVideo.bat](PortableDemo/1.4/OpenposeVideo.bat) 
      - [OpenposeVideo_en.bat](OpenposeVideo_en.bat) is in English. !! The logs remain in Japanese.
    - 自力ビルド版：`x64`のディレクトリの下に、[self-build/OpenposeVideo.bat](self-build/OpenposeVideo.bat) をコピーする
    - [OpenposeVideo_en.bat](OpenposeVideo_en.bat) is in English. !! The logs remain in Japanese.
1. [OpenposeVideo.bat](OpenposeVideo.bat) を実行する
1. `解析対象映像ファイルパス` が聞かれるので、動画のファイルフルパスを入力する
1. `映像に映っている最大人数` が聞かれるので、映像から読み取りたい最大人数を1始まりで指定する
	- 未指定の場合、デフォルトで1が設定される(１人分の解析)
1. `解析開始フレームNo` が聞かれるので、解析を開始するフレームNoを0始まりで指定する
	- ロゴ等で冒頭に人物が映っていない場合に、人物が映るようになった最初のフレームNoを指定する事で、先頭フレームをスキップできる
	- 未指定の場合、デフォルトで0が設定される(0フレーム目から解析)
1. 処理開始
1. 処理が終了すると、以下に結果が出力される。
    - `解析対象映像ファイルパス/{解析対象映像ファイル名}_{実行日時}/{解析対象映像ファイル名}_json` ディレクトリ
        - → json形式のkeypointsデータ
    - `解析対象映像ファイルパス/{解析対象映像ファイル名}_{実行日時}/{解析対象映像ファイル名}_openpose.avi`
        - → 元映像にOpenposeの解析結果を上乗せしたaviデータ

### 画像の場合

1. `Openpose`の実行ディレクトリ(`bin`とかの一個上) に簡易起動バッチをコピーする
    - PortableDemo版： `LICENSE`のファイルがある階層に、バージョン別のバッチをコピー
      - 1.3 … [PortableDemo/1.3/OpenposeImage.bat](PortableDemo/1.3/OpenposeImage.bat) 
      - 1.4 … [PortableDemo/1.4/OpenposeImage.bat](PortableDemo/1.4/OpenposeImage.bat) 
      - [OpenposeImage_en.bat](OpenposeImage_en.bat) is in English. !! The logs remain in Japanese.
    - 自力ビルド版：`x64`のディレクトリの下に、[self-build/OpenposeImage.bat](self-build/OpenposeImage.bat) をコピーする
    - [OpenposeImage_en.bat](OpenposeImage_en.bat) is in English. !! The logs remain in Japanese.
1. [OpenposeImage.bat](OpenposeImage.bat) を実行する
1. `解析対象画像ディレクトリパス` が聞かれるので、画像が置かれているディレクトリのフルパスを入力する
    - ディレクトリ内には複数枚の画像を置ける
1. `映像に映っている最大人数` が聞かれるので、映像から読み取りたい最大人数を1始まりで指定する
	- 未指定の場合、デフォルトで1が設定される(１人分の解析)
1. 処理開始
1. 処理が終了すると、以下に結果が出力される。
    - `解析対象画像ディレクトリパス/{解析対象画像ディレクトリ名}_{実行日時}/{解析対象画像ディレクトリ名}_json` ディレクトリ/{解析対象画像ファイル名}_keypoints.json.png
        - → json形式のkeypointsデータ
    - `解析対象画像ディレクトリパス/{解析対象画像ディレクトリ名}_{実行日時}/{解析対象画像ディレクトリ名}_openpose/{解析対象画像ファイル名}_rendered.png`
        - → 元画像にOpenposeの解析結果を上乗せしたpngデータ
1. ※画像解析結果は、3d-pose-baseline-vmd 以降には使用できません。

## 注意点

- `JSON出力先ディレクトリパス` に12桁の数字列は使わないで下さい。
    - `short02_000000000000_keypoints.json` のように、`{任意ファイル名}_{フレーム番号}_keypoints.json` というファイル名のうち、12桁の数字をフレーム番号として後ほど抽出するため

## ライセンス
GNU GPLv3

[MMDモーショントレース自動化キットライセンス](https://ch.nicovideo.jp/miu200521358/blomaga/ar1686913)
