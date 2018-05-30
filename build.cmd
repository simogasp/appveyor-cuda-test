@echo off
echo Downloading CUDA toolkit 9
appveyor DownloadFile  https://developer.nvidia.com/compute/cuda/9.1/Prod/local_installers/cuda_9.1.85_windows -FileName cuda_9.1.85_windows.exe
dir
echo Installing CUDA toolkit 9
cuda_9.1.85_windows.exe -s nvcc_9.1 ^
                           cublas_9.1 ^
                           cublas_dev_9.1 ^
                           cudart_9.1 ^
                           curand_9.1 ^
                           curand_dev_9.1
echo Downloading cuDNN
appveyor DownloadFile https://developer.nvidia.com/compute/machine-learning/cudnn/secure/v7.0.5/prod/9.1_20171129/cudnn-9.1-windows7-x64-v7 -FileName cudnn-9.1-windows7-x64-v7
7z x cudnn-9.1-windows7-x64-v7 -ocudnn
dir cudnn
dir cudnn\cuda\bin
dir cudnn\cuda\lib 
dir cudnn\cuda\include     

dir .

dir "%ProgramFiles%"
dir "C:\Program Files"
dir "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA"
dir "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v9.1"
dir "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v9.1\bin"

if NOT EXIST "%ProgramFiles%\NVIDIA GPU Computing Toolkit\CUDA\v9.1\bin\cudart64_91.dll" ( 
echo "Failed to install CUDA"
exit /B 1
)

set PATH=%ProgramFiles%\NVIDIA GPU Computing Toolkit\CUDA\v9.1\bin;%ProgramFiles%\NVIDIA GPU Computing Toolkit\CUDA\v9.1\libnvvp;%PATH%

nvcc -V
