
% I've done a version of this where the random numbers are generated as it
% loops which may be better for keeping space requirements down when
% training.

%% make test data: x,y,l,\theta
pixel_length_0=11;
x_0=randn(10,1);
y_0=randn(10,1);
theta_0=rand(10,1)*pi;

[x,y,theta,pixel_length]=ndgrid(x_0,y_0,theta_0,pixel_length_0);

%% create template:

[X,Y]=meshgrid(linspace(-3,3,50),linspace(-3,3,50));

Iout=sinc(sqrt(X.^2+Y.^2)); %convolution kernel to emulate microscope resolution.
% Iout=sinc(sqrt(X.^2+Y.^2)).*exp((-X.^2-Y.^2)/3); %convolution kernel to emulate microscope resolution.
lin=zeros(200);
lin(101+[-floor(pixel_length(1)/2):floor(pixel_length(1)/2-.001)],101)=1; %create vertical line to represent ecoli body.

LIN=filter2(Iout,lin);              %convolve

[indi,indj]=find(LIN~=0);           %find the active part of the template.

[ai1]=min(indi)-1;                  %pad around the template
[ai2]=max(indi)+1;
[aj1]=min(indj)-1;
[aj2]=max(indj)+1;

template_image=LIN(ai1:ai2,aj1:aj2);%extract template to randomize.
[Xt,Yt]=meshgrid([1:size(LIN,2)]-size(LIN,2)/2,[1:size(LIN,1)]-size(LIN,2)/2);%create coordinates for interpolation.

%%


% first create output pixel grid:
[Xf,Yf]=meshgrid([-50:50],[-50:50]);

% I_act are the training data as a: image size * number of frames size
% container
I_act=zeros([size(Xf),numel(x)]);
for ii=1:numel(x)
% ii = 1
    I_act(:,:,ii)=interp2(Xt,Yt,LIN,(Xf-x(ii))*cos(theta(ii))-(Yf-y(ii))*sin(theta(ii)),(Yf-y(ii))*cos(theta(ii))+(Xf-x(ii))*sin(theta(ii)),'cubic',0);
    temp = I_act(:, :, ii);
    temp = interp2(I_act(:,:,ii), 1);
    [M, idx] = max(temp);
    [Max, Aj] = max(M);
    Ai = idx(Aj);
    Ai
    Aj
    theta
    dlmwrite('csv/data.csv', [Ai, Aj, theta(ii)], 'delimiter', ',', '-append')
end

% V = interp2(I_act(:,:,1), 1)

%% plot to verify it creates the desired images:
file_name = "rimage";
for ii=1:numel(x)
    imagesc(I_act(:,:,ii))
%     drawnow
    % imInd = gray2ind(I_act(:,:,ii), 101);
    % jetRGB = ind2rgb(imInd, jet(101));
    imwrite(I_act(:, :, ii), file_name+ii+".jpg", "jpg")
end