@echo off
echo Downloading CUDA toolkit 9.2
appveyor DownloadFile https://developer.nvidia.com/compute/cuda/9.2/Prod/local_installers/cuda_9.2.88_windows -FileName cuda_9.2.88_windows.exe
dir
echo Installing CUDA toolkit 9.2
cuda_9.2.88_windows.exe -s nvcc_9.2 ^
                           cublas_9.2 ^
                           cublas_dev_9.2 ^
                           cudart_9.2 ^
                           curand_9.2 ^
                           curand_dev_9.2
echo Downloading cuDNN
appveyor DownloadFile https://developer.nvidia.com/compute/machine-learning/cudnn/secure/v7.1.4/prod/9.2_20180516/cudnn-9.2-windows7-x64-v7.1 -FileName cudnn-9.2-windows7-x64-v7.1
7z x cudnn-9.2-windows7-x64-v7.1 -ocudnn
dir cudnn
dir cudnn\cuda\bin
dir cudnn\cuda\lib 
dir cudnn\cuda\include     

dir .

dir "%ProgramFiles%"
dir "C:\Program Files"
dir "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA"
dir "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v9.2"
dir "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v9.2\bin"

if NOT EXIST "%ProgramFiles%\NVIDIA GPU Computing Toolkit\CUDA\v9.2\bin\cudart64_92.dll" ( 
echo "Failed to install CUDA"
exit /B 1
)

set PATH=%ProgramFiles%\NVIDIA GPU Computing Toolkit\CUDA\v9.2\bin;%ProgramFiles%\NVIDIA GPU Computing Toolkit\CUDA\v9.2\libnvvp;%PATH%

nvcc -V
