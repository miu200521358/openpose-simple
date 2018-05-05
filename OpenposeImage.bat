@echo off
rem --- 
rem ---  OpenPose の jsonデータから 3Dデータに変換
rem --- 

rem ---  カレントディレクトリを実行先に変更
cd /d %~dp0

rem ---  入力対象画像ディレクトリパス
set /P INPUT_IMAGE="入力対象画像ディレクトリパス: "
rem --- echo INPUT_IMAGE：%INPUT_IMAGE%

rem ---  JSON出力先ディレクトリパス
set /P OUTPUT_JSON="JSON出力先ディレクトリパス: "
rem --- echo OUTPUT_JSON：%OUTPUT_JSON%

rem ---  画像出力先ディレクトリパス
set /P OUTPUT_IMAGE="画像出力先ファイルパス(.pngまで指定): "
rem --- echo OUTPUT_IMAGE：%OUTPUT_IMAGE%

rem ---  画像に映っている最大人数
set /P NUMBER_PEOPLE_MAX="画像に映っている最大人数: "
rem --- echo NUMBER_PEOPLE_MAX：%NUMBER_PEOPLE_MAX%

rem -- exe実行
Release\OpenPoseDemo.exe --image_dir %INPUT_IMAGE% --write_json %OUTPUT_JSON% --write_images %OUTPUT_IMAGE% --number_people_max %NUMBER_PEOPLE_MAX%

