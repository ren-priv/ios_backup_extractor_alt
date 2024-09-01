@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion

REM 引数のチェック
set "backup_id="
set "output_folder="

:parse_args
if "%~1"=="" goto :check_args
if /i "%~1"=="-b" set "backup_id=%~2" & shift & shift & goto :parse_args
if /i "%~1"=="-o" set "output_folder=%~2" & shift & shift & goto :parse_args
shift
goto :parse_args

:check_args
if not defined backup_id (
    echo エラー: バックアップIDが指定されていません。
    goto :usage
)
if not defined output_folder (
    echo エラー: 出力先フォルダが指定されていません。
    goto :usage
)

REM 出力先フォルダが存在しない場合は作成
if not exist "%output_folder%" (
    mkdir "%output_folder%" || (
        echo エラー: 出力先フォルダを作成できません。
        exit /b 1
    )
)

REM ios_backup_extractor.exeを実行
ios_backup_extractor.exe "%backup_id%" --out "%output_folder%" 

REM 出力先フォルダに移動
cd /d "%output_folder%" || (
    echo エラー: 出力先フォルダに移動できません。
    exit /b 1
)

REM サブディレクトリをループ
for /d %%D in (*) do (
    REM 各サブディレクトリ内のファイルをループ
    for %%F in ("%%D\*") do (
        REM 新しいファイル名を生成
        set "filename=%%~nxF"
        set "newname=%%D_!filename!"
        
        REM ファイルを移動
        move "%%F" "!newname!"
    )
)

REM 空のサブディレクトリを削除
for /d %%D in (*) do (
    rmdir "%%D" 2>nul
)

echo 完了しました。
pause
exit /b 0

:usage
echo 使用方法: %~nx0 -b "backup_id" -o "output_folder"
echo 例: %~nx0 -b "1234567890abcdef" -o "C:\Backups\iOSExtract"
exit /b 1