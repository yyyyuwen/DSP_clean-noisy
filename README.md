# DSP Clean Noise
###### tags: `NCKU` `DSP` `python`


## Environment
* macOS
* python3 
* matlab

## Requirement
將原音檔的noise的雜訊清除，並以spectrogram輸出圖片做比較。


## Overview

![](https://i.imgur.com/o5K9avF.png)
首先先去比較有Noise以及沒有Noise的音檔，利用頻譜呈現。

### 方法一 只使用Band-pass Filter
![](https://i.imgur.com/smMTZ8S.png)
**Fig: Only bandpass filter**


![](https://i.imgur.com/Ab8z0wv.png)

**bandpass filter**是可以將一段區間內的訊號濾掉。


### 方法二 額外使用了High-pass and Low-pass Filter
![](https://i.imgur.com/UINcj3o.png)

此方法額外使用了兩種濾波器，High-pass Filter 是只允許指定頻率以上的訊號通過，反之，Low-pass Filtler則是只允許指定頻率以下的訊號通過。
