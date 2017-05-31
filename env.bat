@echo off
setlocal
conda install -c conda-forge opencv=3.2.0
conda install -c conda-forge ffmpeg=3.2.4
pip install moviepy 
endlocal
