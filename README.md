### Description

Scripts to estimate ccache efficiency during extensive cmake check. This approach allows to quickly check full library compilation in several similar configurations or using several tools versions. 

Possible scenarios:
- cmake versions
- library configs (GTK, QT, IPP, IPPICV, ...)
- module configurations (disable one or several modules)

### Instruction

- docker should be installed

1. Download several cmake Linux binary distributives (*.tar.gz, version >= 2.8.7) and put into this folder
2. Download OpenCV and OpenCV contrib sources somewhere (for example $HOME/opencv and $HOME/opencv_contrib)
3. Create empty directory for cache. Update volume binding paths in `do.sh` with your actual locations (`-v <absolute-source-location>:<absolute-dest-location>`). 
4. Run `do.sh` and check total compilation time.
5. Try different cmake options and ccache configs

If full compilation from scratch takes 1 time period, then full compilation of 7 configurations will take 7 time periods. And ccache allows to reduce this time to ~1.5-2 periods.
