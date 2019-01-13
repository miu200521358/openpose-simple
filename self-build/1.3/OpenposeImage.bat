@echo off
rem --- 
rem ---  画像データから Openpose骨格データに変換
rem --- 

rem ---  カレントディレクトリを実行先に変更
cd /d %~dp0

rem ---  入力対象画像ファイルパス
echo 解析対象となる画像が入っているディレクトリのフルパスを入力して下さい。
echo ディレクトリ内には複数の画像を置くことができます。
echo この設定は半角英数字のみ設定可能で、必須項目です。
set INPUT_IMAGE_DIR=
set /P INPUT_IMAGE_DIR=■解析対象画像ディレクトリパス: 
rem echo INPUT_IMAGE_DIR：%INPUT_IMAGE_DIR%

IF /I "%INPUT_IMAGE_DIR%" EQU "" (
    ECHO 解析対象画像ディレクトリパスが設定されていないため、処理を中断します。
    EXIT /B
)

rem ---  画像に映っている最大人数

echo --------------
echo 画像に映っている最大人数を入力して下さい。
echo 何も入力せず、ENTERを押下した場合、1人分の解析になります。
echo 複数人数が同程度の大きさで映っている映像で1人だけ指定した場合、解析対象が飛ぶ場合があります。
set NUMBER_PEOPLE_MAX=1
set /P NUMBER_PEOPLE_MAX="■画像に映っている最大人数: "

rem --echo NUMBER_PEOPLE_MAX: %NUMBER_PEOPLE_MAX%

rem -----------------------------------
rem --- 入力画像パス
FOR %%1 IN (%INPUT_IMAGE_DIR%) DO (
    rem -- 入力画像パスの親ディレクトリと、ファイル名+_jsonでパス生成
    set INPUT_IMAGE_DIR_PARENT=%%~1\
    set INPUT_IMAGE_DIRNAME=%%~n1
)

rem -- 実行日付
set DT=%date%
rem -- 実行時間
set TM=%time%
rem -- 時間の空白を0に置換
set TM2=%TM: =0%
rem -- 実行日時をファイル名用に置換
set DTTM=%dt:~0,4%%dt:~5,2%%dt:~8,2%_%TM2:~0,2%%TM2:~3,2%%TM2:~6,2%

echo --------------

rem ------------------------------------------------
rem -- JSON出力ディレクトリ
set OUTPUT_JSON_DIR=%INPUT_IMAGE_DIR_PARENT%%DTTM%\%INPUT_IMAGE_DIRNAME%_json
rem echo %OUTPUT_JSON_DIR%

rem -- JSON出力ディレクトリ生成
mkdir %OUTPUT_JSON_DIR%
echo 解析結果JSONディレクトリ：%OUTPUT_JSON_DIR%

rem ------------------------------------------------
rem -- 画像出力ディレクトリ
set OUTPUT_IMAGE_PATH=%INPUT_IMAGE_DIR_PARENT%%DTTM%\%INPUT_IMAGE_DIRNAME%_openpose.png
echo 解析結果pngファイル：%OUTPUT_IMAGE_PATH%

echo --------------
echo Openpose解析を開始します。
echo 解析を中断したい場合、ESCキーを押下して下さい。

rem -- exe実行
Release\OpenPoseDemo.exe --image_dir %INPUT_IMAGE_DIR% --write_json %OUTPUT_JSON_DIR% --write_images %OUTPUT_IMAGE_PATH% --number_people_max %NUMBER_PEOPLE_MAX%

echo --------------
echo Done!!
echo Openpose解析が終わりました。
echo ※画像解析結果は3d-pose-baseline-vmd 以降には適用できません。
echo %OUTPUT_JSON_DIR%

