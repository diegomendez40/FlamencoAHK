@echo off
:: ========================================
:: Bing Wallpaper Copier
:: 
:: Author: diegomendez40
:: Last Updated: 10.07.24
::
:: Description:
:: This script copies Bing wallpapers from the default
:: storage location to a custom folder.
:: ========================================

:: Change to UTF-8 encoding to handle non-ASCII characters
chcp 65001 > nul

:: Copy files from Bing Wallpaper App folder to custom location
:: /s : Copies directories and subdirectories
:: /y : Suppresses prompting to confirm overwriting of existing destination files
:: /i : If destination does not exist and copying more than one file, assumes that destination must be a directory
xcopy /s /y /i "C:\Users\diego\AppData\Local\Microsoft\BingWallpaperApp\WPImages\*" "E:\Imágenes\Wallpapers\bing"

:: Pause to keep the window open and see the results
pause

:: End of script