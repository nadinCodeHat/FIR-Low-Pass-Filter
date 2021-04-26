f1=100;f2=200;%the frequencies of sines signal that needs filtered
fs=2000;%sampling frequency
m=(0.3*f1)/(fs/2);%define tansition bandwidth
M=round(8/m);%define the window length
N=M-1;%define the order of filter
b=fir1(N,0.5*f2/(fs/2));%use the firl function to design a filter
%Input parameters are respectively the order number and the cutoff
%frequency of filter

figure(1)
[h,f]=freqz(b,1,512);%amplitude-frequency characteristic graph
plot(f*fs/(2*pi),20*log10(abs(h)))%parameters are respectively frequency and amplitude
xlabel('frequency/Hz');ylabel('gain/dB');title('The gain response of lowpass filter');
figure(2)
subplot(211)
t=0:1/fs:0.2;%define the time domain and the steplength
s=sin(2*pi*f1*t)+sin(2*pi*f2*t);%signal before filtering
plot(t,s);%plot the signal graph before filtering
xlabel('time/s');ylabel('amplitude');title('Time-domain diagram before filtering');
axis([0 0.1 -2 2]);
subplot(212)
Fs=fft(s,512);%transform the signal to frequency domain
AFs=abs(Fs);%take the amplitude
f=(0:255)*fs/512;%frequency sampling
plot(f,AFs(1:256));%plot the frequency domain diagram before filtering
xlabel('frequency/Hz');ylabel('amplitude');title('Frequency-domain diagram before filtering');

figure(3)
sf=filter(b,1,s);%use filter function to filter
subplot(211)
plot(t,sf)%plot the signal graph after filtering
xlabel('time/s');ylabel('amplitude');title('Time-domain diagram after filtering');
axis([0.1 0.2 -2 2]);
subplot(212)
Fsf=fft(sf,512);%frequency-domain diagram after filtering
AFsf=abs(Fsf);%the amplitude
f=(0:255)*fs/512;%frequency sampling
plot(f,AFsf(1:256))%plot the frequency domain diagram after filtering
xlabel('frequency/Hz');ylabel('amplitude');title('Frequency-domain diagram after filtering');
