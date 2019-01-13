@echo off
rem --- 
rem ---  Convert image data to Openpose skeleton data
rem --- 

rem ---  Change the current directory to the execution destination
cd /d %~dp0

rem ---  Input target image file path
echo Please enter the full path of the directory containing the image to be analyzed.
echo Multiple images can be placed in the directory.
echo This setting is available only for half size alphanumeric characters, it is a required item.
set INPUT_IMAGE_DIR=
set /P INPUT_IMAGE_DIR=** Analysis target image directory path: 
rem echo INPUT_IMAGE_DIR：%INPUT_IMAGE_DIR%

IF /I "%INPUT_IMAGE_DIR%" EQU "" (
    ECHO Processing is suspended because analysis target image directory path is not set.
    EXIT /B
)

rem ---  Maximum number of people in the image

echo --------------
echo Please enter the maximum number of people shown in the image.
echo If you do not enter anything and press ENTER, it will be analysis for one person.
echo If you specify only one person in the image of which the number of people is the same size, the analysis subject may jump.
set NUMBER_PEOPLE_MAX=1
set /P NUMBER_PEOPLE_MAX="** Maximum number of people in the image: "

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
echo Analysis result JSON directory：%OUTPUT_JSON_DIR%

rem ------------------------------------------------
rem -- 画像出力ディレクトリ
set OUTPUT_IMAGE_PATH=%INPUT_IMAGE_DIR_PARENT%%DTTM%\%INPUT_IMAGE_DIRNAME%_openpose.png
echo Analysis result png file：%OUTPUT_IMAGE_PATH%

echo --------------
echo Start analyzing with Openpose.
echo If you want to interrupt the analysis, please press the ESC key.

rem -- exe実行
bin\OpenPoseDemo.exe --image_dir %INPUT_IMAGE_DIR% --write_json %OUTPUT_JSON_DIR% --write_images %OUTPUT_IMAGE_PATH% --number_people_max %NUMBER_PEOPLE_MAX%

echo --------------
echo Done!!
echo The analysis with Openpose is over.
echo !!! Image analysis results can not be applied after 3d-pose-baseline-vmd.
echo %OUTPUT_JSON_DIR%

