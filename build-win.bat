@echo off

if NOT "%1" == "x64" if NOT "%1" == "x86" (
    echo Must specify first argument as x86 or x64
    goto :error
)
if "%1" == "x64" (
    set arch=x64
    set cmake_gen="Visual Studio 16 2019"
)
if "%1" == "x86" (
    set arch=Win32
    set cmake_gen="Visual Studio 16 2019"
)

rd /s /q "build_%arch%"
cmake -H. -Bbuild_%arch% -G %cmake_gen% -A %arch%
cmake --build ./build_%arch% --target secp256k1 --config Release