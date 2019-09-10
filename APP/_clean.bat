@echo off

rem чистим компиляцию x32
if exist %1Win32\Debug\*.dcu del %1Win32\Debug\*.dcu /Q
if exist %1Win32\Debug\*.rsm del %1Win32\Debug\*.rsm /Q
if exist %1Win32\Debug\*.exe del %1Win32\Debug\*.exe /Q

rem чистим компиляцию x64
if exist %1Win64\Debug\*.dcu del %1Win64\Debug\*.dcu /Q
if exist %1Win64\Debug\*.rsm del %1Win64\Debug\*.rsm /Q
if exist %1Win64\Debug\*.exe del %1Win64\Debug\*.exe /Q

rem чистим историю
if exist %1__history\*.* del %1__history\*.* /Q

if exist %1DataModule\__history\*.* del %1DataModule\__history\*.* /Q

if exist %1Units\__history\*.* del %1Units\__history\*.* /Q
if exist %1Units\Conductor\__history\*.* del %1Units\Conductor\__history\*.* /Q
if exist %1Units\Trade\__history\*.* del %1Units\Trade\__history\*.* /Q

if exist %1Forms\__history\*.* del %1Forms\__history\*.* /Q
if exist %1Forms\List\__history\*.* del %1Forms\List\__history\*.* /Q
if exist %1Forms\DDF\__history\*.* del %1Forms\DDF\__history\*.* /Q
if exist %1Forms\Dialogue\__history\*.* del %1Forms\Dialogue\__history\*.* /Q
if exist %1Forms\Periods\__history\*.* del %1Forms\Periods\__history\*.* /Q
if exist %1Forms\Ray\__history\*.* del %1Forms\Ray\__history\*.* /Q
if exist %1Forms\Trade\__history\*.* del %1Forms\Trade\__history\*.* /Q
if exist %1Forms\Acc\__history\*.* del %1Forms\Acc\__history\*.* /Q
if exist %1Forms\Fin\__history\*.* del %1Forms\Fin\__history\*.* /Q
if exist %1Forms\Tre\__history\*.* del %1Forms\Tre\__history\*.* /Q

if exist %1Frames\__history\*.* del %Frames\__history\*.* /Q
if exist %1Frames\Trade\__history\*.* del %Frames\Trade\__history\*.* /Q
