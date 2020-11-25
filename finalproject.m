clc, clear all, close all

%%%%%%%%%%%%%%%% TESTE 1 %%%%%%%%%%%%%%%%
% melhor até agora

videoSelect = 1;

if videoSelect == 1 %VIDEO 2
    %cd ('C:\Users\Avell B154 PLUS\Desktop\ENGENHARIA DE COMPUTACAO\MATLAB atividades\projeto final\frames 2');
    %%%%%%%%%%%%%%%% gerei todos os frames %%%%%%%%%%%%%%%%
    %video2 = VideoReader("video2.mp4");

    %for i = 1:video2.NumberOfFrames;
    %    filename = strcat('frame',num2str(i),'.jpg');
    %    b = read(video2, i);
    %    imwrite(b,filename);
    %end
    %%%%%%%%%%%%%%%% gerei todos os frames %%%%%%%%%%%%%%%%
    
    %vai para diretorio dos frames 2
    cd ('C:\Users\Avell B154 PLUS\Desktop\ENGENHARIA DE COMPUTACAO\MATLAB atividades\projeto final\frames 2');
    writeObj = VideoWriter('vid2.mp4');
    for x = 1:1:952 %952

        string = ['frame' num2str(x) '.jpg'];
        frame = imread (string);
        frame = im2double(frame);
        
        Sh = fspecial('sobel');                  %  1  2  1
        gSh = imfilter(frame,Sh,'replicate');    %  0  0  0
        Sv = Sh';                                % -1 -2 -1
        gSv = imfilter(frame,Sv,'replicate');
        figure ,imshow(gSv);
        S = max(abs(gSv),  abs(gSh));

        gSh = mat2gray(gSh);
        gSv = mat2gray(gSv);
        S = mat2gray(S);
        Sbw = im2bw(S,graythresh(S));
        
        se = strel('rectangle', [14 1]); %15, 1 GARGALO DO ALGORITMO
        Sbw = imopen(Sbw, se);
        
        for i=1:1:960 %faz um retangulo e tira os brancos fora dele
            for j=1:1:1280
                if j >= 350 && i >= 270 && j <= 915
                    if Sbw(i, j) == 1
                        frame(i, j, 3) = 255;
                    end
                end
            end
        end
        
    %salva imagens no diretorio frames2detectados
    baseFileName = ['frame' num2str(x) 'detectado.jpg'];
    fullFileName = fullfile('C:\Users\Avell B154 PLUS\Desktop\ENGENHARIA DE COMPUTACAO\MATLAB atividades\projeto final\frames2detectados', baseFileName);
    imwrite (frame, fullFileName);

    end

    cd 'C:\Users\Avell B154 PLUS\Desktop\ENGENHARIA DE COMPUTACAO\MATLAB atividades\projeto final\frames2detectados'

    open(writeObj);
    for i=1:1:952
        baseFileName = ['frame' num2str(i) 'detectado.jpg'];
        imgArray = imread(baseFileName);
        writeVideo(writeObj, imgArray);
    end
    close(writeObj);
end

if videoSelect == 0 %VIDEO 1
    cd 'C:\Users\Avell B154 PLUS\Desktop\ENGENHARIA DE COMPUTACAO\MATLAB atividades\projeto final\frames 1';
    %%%%%%%%%%%%%%%% gerei todos os frames %%%%%%%%%%%%%%%%
    video1 = VideoReader("video1.mp4");
    
    for i = 1:video1.NumberOfFrames;
        filename = strcat('frame',num2str(i),'.jpg');
        b = read(video1, i);
        imwrite(b,filename);
    end
    %%%%%%%%%%%%%%%% gerei todos os frames %%%%%%%%%%%%%%%%
    
     %vai para diretorio dos frames 1
    cd 'C:\Users\Avell B154 PLUS\Desktop\ENGENHARIA DE COMPUTACAO\MATLAB atividades\projeto final\frames 1';
    writeObj = VideoWriter('vid1.mp4');
    for x = 1:1:1752 %1752
        string = ['frame' num2str(x) '.jpg'];
        frame = imread (string);
        frame = im2double(frame);

        Sh = fspecial('sobel');
        gSh = imfilter(frame,Sh,'replicate');
        Sv = Sh';
        gSv = imfilter(frame,Sv,'replicate');
        S = max(abs(gSv),  abs(gSh));
        gSh = mat2gray(gSh);
        gSv = mat2gray(gSv);
        S = mat2gray(S);
        Sbw = im2bw(S,graythresh(S));

        se = strel('rectangle', [14 1]); %14, 1 GARGALO DO ALGORITMO
        Sbw = imopen(Sbw, se);

        for i=1:1:960 %faz um retangulo e tira os brancos fora dele
            for j=1:1:1280
                if j >= 310 && i >= 250 && j <= 945
                    if Sbw(i, j) == 1
                        frame(i, j, 3) = 255;
                    end
                end
            end
        end
        
        %salva imagens no diretorio frames2detectados
        baseFileName = ['frame' num2str(x) 'detectado.jpg'];
        fullFileName = fullfile('C:\Users\Avell B154 PLUS\Desktop\ENGENHARIA DE COMPUTACAO\MATLAB atividades\projeto final\frames1detectados', baseFileName);
        imwrite (frame, fullFileName);
        
    end

    cd 'C:\Users\Avell B154 PLUS\Desktop\ENGENHARIA DE COMPUTACAO\MATLAB atividades\projeto final\frames1detectados'

    open(writeObj);
    for i=1:1:1752
        baseFileName = ['frame' num2str(i) 'detectado.jpg'];
        imgArray = imread(baseFileName);
        writeVideo(writeObj, imgArray);
    end

    close(writeObj);
end