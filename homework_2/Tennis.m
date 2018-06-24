pat1 = imread("hw1.bmp");
figure(1)
imshow(pat1)
spec_orig = fft2(double(pat1));
spec_img = fftshift(spec_orig);
figure(2);
imagesc(log10(1+abs(spec_img)));

% retta 1
[m n] = size(spec_img);
x1 = 50;
y1 = 280; 
x2 = 202;
y2 = 306;
a = (y2-y1)/(x2-x1);
for d=  [0]    
    b = ((-x1*(y2-y1))/(x2-x1))+y1;
    for x = 1:m  
      y = a*x+b+d;
      if y<((n/2)-3) | y>((n/2)+3)        
          if x<m & x>0 
            if x<((m/2)-12) | x>((m/2)+12)
              spec_img(x,round(y)-1:round(y)+1) = zeros(1,3);
            end
          end
        end
    end
end

% retta 2
[m n] = size(spec_img);
x1 = 10;
y1 = 280;
x2 = 143;
y2 = 302;
a = (y2-y1)/(x2-x1);
for d=  [0]    
    b = ((-x1*(y2-y1))/(x2-x1))+y1;
    for x = 1:m  
      y = a*x+b+d;
      if y<((n/2)-3) | y>((n/2)+3)        
          if x<m & x>0 
            if x<((m/2)-12) | x>((m/2)+12)
              spec_img(x,round(y)-1:round(y)+1) = zeros(1,3);
            end
          end
        end
    end
end


# punti
spec_img(167,261)=0;
spec_img(177,263)=0;

spec_img(171,269)=0;
spec_img(173,255)=0;

% quadrati
spec_img(200:201,220:305)=0;
spec_img(140:141,220:305)=0;


spec_img(143,302)=0;
spec_img(143,304)=0;
spec_img(145,304)=0;
spec_img(147,304)=0;
spec_img(149,304)=0;
spec_img(149,306)=0;

spec_img(195,302)=0;
spec_img(195,304)=0;
spec_img(197,304)=0;
spec_img(199,304)=0;
spec_img(201,304)=0;
spec_img(201,306)=0;


figure(3);
imagesc(log10(1+abs(spec_img)));


ptnfx = real(ifft2(ifftshift(spec_img)));
figure(4)
imshow(ptnfx,[]);