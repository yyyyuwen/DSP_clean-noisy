%Q56091079_李昱玟_hw4

clc
clear all
close all

[y, fs] = audioread('singing16k16bit-clean.wav');   %讀檔
[y_n, fs_n] = audioread('singingWithPhoneRing16k16bit-noisy.wav');


audioHighpass = highpass(y_n, 200, fs);  %highpass
audioLowpass = lowpass(audioHighpass, 300, fs);     %lowpass
%audioBandpass = bandstop(audioBandpass, [1500, 1650], fs);  %bandpass(bandstop)
%sound(audioLowpass, fs);
audiowrite('after_high_low_band.wav', audioLowpass, fs);    %存檔


onlyBp = highpass(y_n, 200, fs);    %讀檔
onlyBp = bandstop(onlyBp, [1100, 3400], fs);    %bandpass(bandstop)
onlyBp = bandstop(onlyBp, [7400, 8000], fs);    %bandpass(bandstop)
onlyBp = bandstop(onlyBp, [4000, 6300], fs);    %bandpass(bandstop)
%sound(onlyBp, fs);
audiowrite('after_band.wav', onlyBp, fs);   %存檔

subplot(4, 1, 1);
grid on;
spectrogram(y, 256, 250, 256, fs, 'yaxis') %將圖呈現出來(x軸：time ,y軸：frequency) 
title('original')


subplot(4, 1, 2);
grid on;
spectrogram(y_n, 256, 250, 256, fs_n, 'yaxis') %將圖呈現出來(x軸：time ,y軸：frequency) 
title('noise')

subplot(4, 1, 3);
grid on;
spectrogram(onlyBp, 256, 250, 256, fs_n, 'yaxis') %將圖呈現出來(x軸：time ,y軸：frequency) 
title('afterFilter(only bandpass')

subplot(4, 1, 4);
grid on;
spectrogram(audioLowpass, 256, 250, 256, fs_n, 'yaxis') %將圖呈現出來(x軸：time ,y軸：frequency) 
title('afterFilter(highpass + lowpass + bandpass)')
