@echo off
rem --- 
rem ---  OpenPose の jsonデータから 3Dデータに変換
rem --- 

rem ---  カレントディレクトリを実行先に変更
cd /d %~dp0

rem ---  入力対象映像ファイルパス
set /P INPUT_VIDEO="入力対象映像ファイルパス: "
rem --- echo INPUT_VIDEO：%INPUT_VIDEO%

rem ---  JSON出力先ディレクトリパス
set /P OUTPUT_JSON="JSON出力先ディレクトリパス: "
rem --- echo OUTPUT_JSON：%OUTPUT_JSON%

rem ---  映像出力先ディレクトリパス
set /P OUTPUT_VIDEO="映像出力先ファイルパス(.aviまで指定): "
rem --- echo OUTPUT_VIDEO：%OUTPUT_VIDEO%

rem ---  映像に映っている最大人数
set /P NUMBER_PEOPLE_MAX="映像に映っている最大人数: "
rem --- echo NUMBER_PEOPLE_MAX：%NUMBER_PEOPLE_MAX%

rem -- exe実行
Release\OpenPoseDemo.exe --video %INPUT_VIDEO% --write_json %OUTPUT_JSON% --write_video %OUTPUT_VIDEO% --number_people_max %NUMBER_PEOPLE_MAX%

