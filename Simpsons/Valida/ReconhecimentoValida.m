
% Define as Classes para arquivo.txt
Bart  = 0;
Homer = 1;
Lisa = 2;
Meggie = 3;
Marge = 4;

%-----ARQUIVOS DE SAIDA---------

vetCaracteristicaASCII = fopen('VetorValida.txt','w');

Numero_Exemplos_Bart = 35;
Numero_Exemplos_Homer = 25;
Numero_Exemplos_Lisa = 13;
Numero_Exemplos_Meggie = 12;
Numero_Exemplos_Marge = 10;

arquivo = dir('*.bmp');
[num, z] = size(arquivo);

%Extrair as cores
%figure;
%subplot(1, 2, 1), imshow('bart001.bmp');
%subplot(1, 2, 2), imshow('homer004.bmp');
%impixelinfo;

 %%
            %-------BART-------
     
for contImage = 1 : Numero_Exemplos_Bart
    [Imagem, Colormap] = imread(arquivo(contImage).name);
    
    % Verifica numero de linhas, colunas e planos da imagem
    [NumLin, NumCol, NumPlan] = size(Imagem);
  
    % Define contadores de pixels 
    ContCamisaBart  = 0;
    ContShortsBart = 0;
    ContBarbaHomer = 0;
    ContSapatoHomer = 0;
    ContColarLisa = 0;
    ContVestidoLisa = 0;
    ContRoupaMeggie = 0;
    ContChupetaMeggie = 0;
    ContCabeloMarge = 0;
    ContVestidoMarge = 0;
    
    %Caracteristicas
    CamisaBart  = [247 99 15.3];
    ShortsBart = [0 7.65 132.6];
    BarbaHomer  = [188.7 173.4 107.1];
    SapatoHomer = [33.15 22.95 33.15];
    VestidoLisa  = [255 0 0];
    ColarLisa = [255 255 255];
    RoupaMeggie  = [0.0 155.5 221.85];
    ChupetaMeggie = [255 0.0 0.0];
    CabeloMarge  = [0.0 66.3 132.6];
    ColarMarge  = [255 0 0];
    VestidoMarge = [147.9 198.9 22.95];
    
    
    % Define uma tolerancia para as cores RGB, pois pode haver uma pequena variacao de imagem para imagem
    Tol = 5;
   
    for j = 1 : NumLin
        for k = 1 : NumCol
            if(Imagem(j, k, 1) >= CamisaBart(1)-Tol && Imagem(j, k, 1) <= CamisaBart(1)+Tol) 
                ContCamisaBart = ContCamisaBart + 1;
          
            elseif (Imagem(j,k,1) >= ShortsBart(1)-Tol && Imagem(j,k,1) <= ShortsBart(1)+Tol)
                    ContShortsBart = ContShortsBart + 1;
            
            
            elseif(Imagem(j, k, 1) >= BarbaHomer(1)-Tol && Imagem(j,k,1) <= BarbaHomer(1)+Tol )                
                  ContBarbaHomer = ContBarbaHomer + 1;
          
            elseif(Imagem(j, k, 1) >= SapatoHomer(1)-Tol && Imagem(j, k,1) <= SapatoHomer(1)+Tol )
                    ContSapatoHomer = ContSapatoHomer + 1;
            
            
            elseif(Imagem(j, k, 1) >= VestidoLisa(1)-Tol && Imagem(j,k,1) <= VestidoLisa(1)+Tol)
                  ContVestidoLisa = ContVestidoLisa + 1;
          
            elseif ( Imagem(j,k,1) >= ColarLisa(1)-Tol && Imagem(j,k,1) <= ColarLisa(1)+Tol)                    
                    ColarLisa = ColarLisa + 1;
            
   
            elseif(Imagem(j, k, 1) >= RoupaMeggie(1)-Tol && Imagem(j,k,1) <= RoupaMeggie(1)+Tol)
                  ContRoupaMeggie = ContRoupaMeggie + 1;
          
            elseif ( Imagem(j,k,1) >= ChupetaMeggie(1)-Tol && Imagem(j,k,1) <= ChupetaMeggie(1)+Tol)
                  ContChupetaMeggie = ContChupetaMeggie + 1;
             
            
            elseif(Imagem(j, k, 1) >= CabeloMarge(1)-Tol && Imagem(j,k,1) <= CabeloMarge(1)+Tol)
                  ContCabeloMarge = ContCabeloMarge + 1;
          
            
            elseif (Imagem(j, k, 1) >= VestidoMarge(1)-Tol && Imagem(j,k,1) <= VestidoMarge(1)+Tol)
                  ContCabeloMarge = ContCabeloMarge + 1;
            
            end
        end
    end
    
    
     % ----------------NORMALIZACAO DAS CARACTERISTICAS---------------
     
    NumTotalPixels = NumLin * NumCol;

    % Normaliza  os valores pelo numero total de pixels na imagem
    ContCamisaBart  = ContCamisaBart / NumTotalPixels; 
    ContShortsBart = ContShortsBart / NumTotalPixels;
    
    ContBarbaHomer  = ContBarbaHomer / NumTotalPixels; 
    ContSapatoHomer  = ContSapatoHomer / NumTotalPixels;
    
    ContVestidoLisa  = ContVestidoLisa / NumTotalPixels; 
    ContColarLisa = ContColarLisa / NumTotalPixels;
    
    ContRoupaMeggie  = ContRoupaMeggie / NumTotalPixels; 
    ContChupetaMeggie = ContChupetaMeggie / NumTotalPixels;
    
    ContVestidoMarge = ContVestidoMarge / NumTotalPixels;
    ContCabeloMarge = ContCabeloMarge / NumTotalPixels;    
    
    %Salvar no arquivo
    
    fprintf(vetCaracteristicaASCII, '%f %f %f %f %f %f %f %f %f %f %d\n', ContCamisaBart, ContShortsBart, ContBarbaHomer, ContSapatoHomer, ContVestidoLisa, ContColarLisa, ContRoupaMeggie, ContChupetaMeggie, ContCabeloMarge, ContVestidoMarge, Bart);  
   
end

%%
              %-------HOMER-------
    
for contImage = Numero_Exemplos_Bart: (Numero_Exemplos_Bart + Numero_Exemplos_Homer)
    [Imagem, Colormap] = imread(arquivo(contImage).name);
    ImagemPeB = imread(arquivo(contImage).name);
    
    % Verifica numero de linhas, colunas e planos da imagem
    [NumLin, NumCol, NumPlan] = size(Imagem);
    
  
    % Define contadores de pixels 
    ContCamisaBart  = 0;
    ContShortsBart = 0;
    ContBarbaHomer = 0;
    ContSapatoHomer = 0;
    ContColarLisa = 0;
    ContVestidoLisa = 0;
    ContRoupaMeggie = 0;
    ContChupetaMeggie = 0;
    ContCabeloMarge = 0;
    ContVestidoMarge = 0;
    
    %Caracteristicas
    CamisaBart  = [247 99 15.3];
    ShortsBart = [0 7.65 132.6];
    BarbaHomer  = [188.7 173.4 107.1];
    SapatoHomer = [33.15 22.95 33.15];
    VestidoLisa  = [255 0 0];
    ColarLisa = [255 255 255];
    RoupaMeggie  = [0.0 155.5 221.85];
    ChupetaMeggie = [255 0.0 0.0];
    CabeloMarge  = [0.0 66.3 132.6];
    ColarMarge  = [255 0 0];
    VestidoMarge = [147.9 198.9 22.95];
    
    
    % Define uma tolerancia para as cores RGB, pois pode haver uma pequena variacao de imagem para imagem
    Tol = 5;
   
    for j = 1 : NumLin
        for k = 1 : NumCol
            if(Imagem(j, k, 1) >= CamisaBart(1)-Tol && Imagem(j, k, 1) <= CamisaBart(1)+Tol) 
                ContCamisaBart = ContCamisaBart + 1;
          
            elseif (Imagem(j,k,1) >= ShortsBart(1)-Tol && Imagem(j,k,1) <= ShortsBart(1)+Tol)
                    ContShortsBart = ContShortsBart + 1;
            
            
            elseif(Imagem(j, k, 1) >= BarbaHomer(1)-Tol && Imagem(j,k,1) <= BarbaHomer(1)+Tol )                
                  ContBarbaHomer = ContBarbaHomer + 1;
          
            elseif(Imagem(j, k, 1) >= SapatoHomer(1)-Tol && Imagem(j, k,1) <= SapatoHomer(1)+Tol )
                    ContSapatoHomer = ContSapatoHomer + 1;
            
            
            elseif(Imagem(j, k, 1) >= VestidoLisa(1)-Tol && Imagem(j,k,1) <= VestidoLisa(1)+Tol)
                  ContVestidoLisa = ContVestidoLisa + 1;
          
            elseif ( Imagem(j,k,1) >= ColarLisa(1)-Tol && Imagem(j,k,1) <= ColarLisa(1)+Tol)                    
                    ColarLisa = ColarLisa + 1;
            
   
            elseif(Imagem(j, k, 1) >= RoupaMeggie(1)-Tol && Imagem(j,k,1) <= RoupaMeggie(1)+Tol)
                  ContRoupaMeggie = ContRoupaMeggie + 1;
          
            elseif ( Imagem(j,k,1) >= ChupetaMeggie(1)-Tol && Imagem(j,k,1) <= ChupetaMeggie(1)+Tol)
                  ContChupetaMeggie = ContChupetaMeggie + 1;
             
            
            elseif(Imagem(j, k, 1) >= CabeloMarge(1)-Tol && Imagem(j,k,1) <= CabeloMarge(1)+Tol)
                  ContCabeloMarge = ContCabeloMarge + 1;
          
            
            elseif (Imagem(j, k, 1) >= VestidoMarge(1)-Tol && Imagem(j,k,1) <= VestidoMarge(1)+Tol)
                  ContCabeloMarge = ContCabeloMarge + 1;
            
            end
        end
    end
    
    
     % ----------------NORMALIZACAO DAS CARACTERISTICAS---------------
     
    NumTotalPixels = NumLin * NumCol;

    % Normaliza  os valores pelo numero total de pixels na imagem
    ContCamisaBart  = ContCamisaBart / NumTotalPixels; 
    ContShortsBart = ContShortsBart / NumTotalPixels;
    
    ContBarbaHomer  = ContBarbaHomer / NumTotalPixels; 
    ContSapatoHomer  = ContSapatoHomer / NumTotalPixels;
    
    ContVestidoLisa  = ContVestidoLisa / NumTotalPixels; 
    ContColarLisa = ContColarLisa / NumTotalPixels;
    
    ContRoupaMeggie  = ContRoupaMeggie / NumTotalPixels; 
    ContChupetaMeggie = ContChupetaMeggie / NumTotalPixels;
 
    ContVestidoMarge = ContVestidoMarge / NumTotalPixels;
    ContCabeloMarge = ContCabeloMarge / NumTotalPixels;    
    
    %Salvar no arquivo
    
    fprintf(vetCaracteristicaASCII, '%f %f %f %f %f %f %f %f %f %f %d\n', ContCamisaBart, ContShortsBart, ContBarbaHomer, ContSapatoHomer, ContVestidoLisa, ContColarLisa, ContRoupaMeggie, ContChupetaMeggie, ContCabeloMarge, ContVestidoMarge, Homer);  
    
end

%%

            %-------LISA-------

for contImage = (Numero_Exemplos_Bart + Numero_Exemplos_Homer) : (Numero_Exemplos_Bart+ Numero_Exemplos_Homer + Numero_Exemplos_Lisa)
    
    [Imagem, Colormap] = imread(arquivo(contImage).name);
    ImagemPeB = imread(arquivo(contImage).name);
    
    [NumLin, NumCol, NumPlan] = size(Imagem);
    
    % Define contadores de pixels 
    ContCamisaBart  = 0;
    ContShortsBart = 0;
    ContBarbaHomer = 0;
    ContSapatoHomer = 0;
    ContColarLisa = 0;
    ContVestidoLisa = 0;
    ContRoupaMeggie = 0;
    ContChupetaMeggie = 0;
    ContCabeloMarge = 0;
    ContVestidoMarge = 0;
    
    %Caracteristicas
    CamisaBart  = [247 99 15.3];
    ShortsBart = [0 7.65 132.6];
    BarbaHomer  = [188.7 173.4 107.1];
    SapatoHomer = [33.15 22.95 33.15];
    VestidoLisa  = [255 0 0];
    ColarLisa = [255 255 255];
    RoupaMeggie  = [0.0 155.5 221.85];
    ChupetaMeggie = [255 0.0 0.0];
    CabeloMarge  = [0.0 66.3 132.6];
    ColarMarge  = [255 0 0];
    VestidoMarge = [147.9 198.9 22.95];
    
    
    % Define uma tolerancia para as cores RGB, pois pode haver uma pequena variacao de imagem para imagem
    Tol = 5;
   
    for j = 1 : NumLin
        for k = 1 : NumCol
            if(Imagem(j, k, 1) >= CamisaBart(1)-Tol && Imagem(j, k, 1) <= CamisaBart(1)+Tol) 
                ContCamisaBart = ContCamisaBart + 1;
          
            elseif (Imagem(j,k,1) >= ShortsBart(1)-Tol && Imagem(j,k,1) <= ShortsBart(1)+Tol)
                    ContShortsBart = ContShortsBart + 1;
            
            
            elseif(Imagem(j, k, 1) >= BarbaHomer(1)-Tol && Imagem(j,k,1) <= BarbaHomer(1)+Tol )                
                  ContBarbaHomer = ContBarbaHomer + 1;
          
            elseif(Imagem(j, k, 1) >= SapatoHomer(1)-Tol && Imagem(j, k,1) <= SapatoHomer(1)+Tol )
                    ContSapatoHomer = ContSapatoHomer + 1;
            
            
            elseif(Imagem(j, k, 1) >= VestidoLisa(1)-Tol && Imagem(j,k,1) <= VestidoLisa(1)+Tol)
                  ContVestidoLisa = ContVestidoLisa + 1;
          
            elseif ( Imagem(j,k,1) >= ColarLisa(1)-Tol && Imagem(j,k,1) <= ColarLisa(1)+Tol)                    
                    ColarLisa = ColarLisa + 1;
            
   
            elseif(Imagem(j, k, 1) >= RoupaMeggie(1)-Tol && Imagem(j,k,1) <= RoupaMeggie(1)+Tol)
                  ContRoupaMeggie = ContRoupaMeggie + 1;
          
            elseif ( Imagem(j,k,1) >= ChupetaMeggie(1)-Tol && Imagem(j,k,1) <= ChupetaMeggie(1)+Tol)
                  ContChupetaMeggie = ContChupetaMeggie + 1;
             
            
            elseif(Imagem(j, k, 1) >= CabeloMarge(1)-Tol && Imagem(j,k,1) <= CabeloMarge(1)+Tol)
                  ContCabeloMarge = ContCabeloMarge + 1;
          
            
            elseif (Imagem(j, k, 1) >= VestidoMarge(1)-Tol && Imagem(j,k,1) <= VestidoMarge(1)+Tol)
                  ContCabeloMarge = ContCabeloMarge + 1;
            
            end
        end
    end
    
    
     % ----------------NORMALIZACAO DAS CARACTERISTICAS---------------
     
    NumTotalPixels = NumLin * NumCol;

    % Normaliza  os valores pelo numero total de pixels na imagem
    ContCamisaBart  = ContCamisaBart / NumTotalPixels; 
    ContShortsBart = ContShortsBart / NumTotalPixels;
    
    ContBarbaHomer  = ContBarbaHomer / NumTotalPixels; 
    ContSapatoHomer  = ContSapatoHomer / NumTotalPixels;
    
    ContVestidoLisa  = ContVestidoLisa / NumTotalPixels; 
    ContColarLisa = ContColarLisa / NumTotalPixels;
    
    ContRoupaMeggie  = ContRoupaMeggie / NumTotalPixels; 
    ContChupetaMeggie = ContChupetaMeggie / NumTotalPixels;
 
    ContVestidoMarge = ContVestidoMarge / NumTotalPixels;
    ContCabeloMarge = ContCabeloMarge / NumTotalPixels;    
    
    %Salvar no arquivo
    
    fprintf(vetCaracteristicaASCII, '%f %f %f %f %f %f %f %f %f %f %d\n', ContCamisaBart, ContShortsBart, ContBarbaHomer, ContSapatoHomer, ContVestidoLisa, ContColarLisa, ContRoupaMeggie, ContChupetaMeggie, ContCabeloMarge, ContVestidoMarge, Lisa);  
        
end

%%

            %-------MEGGIE-------

for contImage = (Numero_Exemplos_Bart+ Numero_Exemplos_Homer + Numero_Exemplos_Lisa) : (Numero_Exemplos_Bart+ Numero_Exemplos_Homer + Numero_Exemplos_Lisa + Numero_Exemplos_Meggie)
    
    [Imagem, Colormap] = imread(arquivo(contImage).name);
    ImagemPeB = imread(arquivo(contImage).name);
    
    [NumLin, NumCol, NumPlan] = size(Imagem);
    
    % Define contadores de pixels 
    ContCamisaBart  = 0;
    ContShortsBart = 0;
    ContBarbaHomer = 0;
    ContSapatoHomer = 0;
    ContColarLisa = 0;
    ContVestidoLisa = 0;
    ContRoupaMeggie = 0;
    ContChupetaMeggie = 0;
    ContCabeloMarge = 0;
    ContVestidoMarge = 0;
    
    %Caracteristicas
    CamisaBart  = [247 99 15.3];
    ShortsBart = [0 7.65 132.6];
    BarbaHomer  = [188.7 173.4 107.1];
    SapatoHomer = [33.15 22.95 33.15];
    VestidoLisa  = [255 0 0];
    ColarLisa = [255 255 255];
    RoupaMeggie  = [0.0 155.5 221.85];
    ChupetaMeggie = [255 0.0 0.0];
    CabeloMarge  = [0.0 66.3 132.6];
    ColarMarge  = [255 0 0];
    VestidoMarge = [147.9 198.9 22.95];
    
    
    % Define uma tolerancia para as cores RGB, pois pode haver uma pequena variacao de imagem para imagem
    Tol = 5;
   
    for j = 1 : NumLin
        for k = 1 : NumCol
            if(Imagem(j, k, 1) >= CamisaBart(1)-Tol && Imagem(j, k, 1) <= CamisaBart(1)+Tol) 
                ContCamisaBart = ContCamisaBart + 1;
          
            elseif (Imagem(j,k,1) >= ShortsBart(1)-Tol && Imagem(j,k,1) <= ShortsBart(1)+Tol)
                    ContShortsBart = ContShortsBart + 1;
            
            
            elseif(Imagem(j, k, 1) >= BarbaHomer(1)-Tol && Imagem(j,k,1) <= BarbaHomer(1)+Tol )                
                  ContBarbaHomer = ContBarbaHomer + 1;
          
            elseif(Imagem(j, k, 1) >= SapatoHomer(1)-Tol && Imagem(j, k,1) <= SapatoHomer(1)+Tol )
                    ContSapatoHomer = ContSapatoHomer + 1;
            
            
            elseif(Imagem(j, k, 1) >= VestidoLisa(1)-Tol && Imagem(j,k,1) <= VestidoLisa(1)+Tol)
                  ContVestidoLisa = ContVestidoLisa + 1;
          
            elseif ( Imagem(j,k,1) >= ColarLisa(1)-Tol && Imagem(j,k,1) <= ColarLisa(1)+Tol)                    
                    ColarLisa = ColarLisa + 1;
            
   
            elseif(Imagem(j, k, 1) >= RoupaMeggie(1)-Tol && Imagem(j,k,1) <= RoupaMeggie(1)+Tol)
                  ContRoupaMeggie = ContRoupaMeggie + 1;
          
            elseif ( Imagem(j,k,1) >= ChupetaMeggie(1)-Tol && Imagem(j,k,1) <= ChupetaMeggie(1)+Tol)
                  ContChupetaMeggie = ContChupetaMeggie + 1;
             
            
            elseif(Imagem(j, k, 1) >= CabeloMarge(1)-Tol && Imagem(j,k,1) <= CabeloMarge(1)+Tol)
                  ContCabeloMarge = ContCabeloMarge + 1;
          
            
            elseif (Imagem(j, k, 1) >= VestidoMarge(1)-Tol && Imagem(j,k,1) <= VestidoMarge(1)+Tol)
                  ContCabeloMarge = ContCabeloMarge + 1;
            
            end
        end
    end
    
    
     % ----------------NORMALIZACAO DAS CARACTERISTICAS---------------
     
    NumTotalPixels = NumLin * NumCol;

    % Normaliza  os valores pelo numero total de pixels na imagem
    ContCamisaBart  = ContCamisaBart / NumTotalPixels; 
    ContShortsBart = ContShortsBart / NumTotalPixels;
    
    ContBarbaHomer  = ContBarbaHomer / NumTotalPixels; 
    ContSapatoHomer  = ContSapatoHomer / NumTotalPixels;
    
    ContVestidoLisa  = ContVestidoLisa / NumTotalPixels; 
    ContColarLisa = ContColarLisa / NumTotalPixels;
    
    ContRoupaMeggie  = ContRoupaMeggie / NumTotalPixels; 
    ContChupetaMeggie = ContChupetaMeggie / NumTotalPixels;
 
    ContVestidoMarge = ContVestidoMarge / NumTotalPixels;
    ContCabeloMarge = ContCabeloMarge / NumTotalPixels;    
    
    %Salvar no arquivo
    
    fprintf(vetCaracteristicaASCII, '%f %f %f %f %f %f %f %f %f %f %d\n', ContCamisaBart, ContShortsBart, ContBarbaHomer, ContSapatoHomer, ContVestidoLisa, ContColarLisa, ContRoupaMeggie, ContChupetaMeggie, ContCabeloMarge, ContVestidoMarge, Meggie);  
    
end

%%
            %-------MARGE-------

for contImage = (Numero_Exemplos_Bart+ Numero_Exemplos_Homer + Numero_Exemplos_Lisa + Numero_Exemplos_Meggie) : (Numero_Exemplos_Bart+ Numero_Exemplos_Homer + Numero_Exemplos_Lisa + Numero_Exemplos_Meggie + Numero_Exemplos_Marge)
    
    [Imagem, Colormap] = imread(arquivo(contImage).name);
    ImagemPeB = imread(arquivo(contImage).name);
    
    [NumLin, NumCol, NumPlan] = size(Imagem);
    
    % Define contadores de pixels 
    ContCamisaBart  = 0;
    ContShortsBart = 0;
    ContBarbaHomer = 0;
    ContSapatoHomer = 0;
    ContColarLisa = 0;
    ContVestidoLisa = 0;
    ContRoupaMeggie = 0;
    ContChupetaMeggie = 0;
    ContCabeloMarge = 0;
    ContVestidoMarge = 0;
    
    %Caracteristicas
    CamisaBart  = [247 99 15.3];
    ShortsBart = [0 7.65 132.6];
    BarbaHomer  = [188.7 173.4 107.1];
    SapatoHomer = [33.15 22.95 33.15];
    VestidoLisa  = [255 0 0];
    ColarLisa = [255 255 255];
    RoupaMeggie  = [0.0 155.5 221.85];
    ChupetaMeggie = [255 0.0 0.0];
    CabeloMarge  = [0.0 66.3 132.6];
    VestidoMarge = [147.9 198.9 22.95];
    
    
    % Define uma tolerancia para as cores RGB, pois pode haver uma pequena variacao de imagem para imagem
    Tol = 5;
   
    for j = 1 : NumLin
        for k = 1 : NumCol
            if(Imagem(j, k, 1) >= CamisaBart(1)-Tol && Imagem(j, k, 1) <= CamisaBart(1)+Tol) 
                ContCamisaBart = ContCamisaBart + 1;
          
            elseif (Imagem(j,k,1) >= ShortsBart(1)-Tol && Imagem(j,k,1) <= ShortsBart(1)+Tol)
                    ContShortsBart = ContShortsBart + 1;
            
            
            elseif(Imagem(j, k, 1) >= BarbaHomer(1)-Tol && Imagem(j,k,1) <= BarbaHomer(1)+Tol )                
                  ContBarbaHomer = ContBarbaHomer + 1;
          
            elseif(Imagem(j, k, 1) >= SapatoHomer(1)-Tol && Imagem(j, k,1) <= SapatoHomer(1)+Tol )
                    ContSapatoHomer = ContSapatoHomer + 1;
            
            
            elseif(Imagem(j, k, 1) >= VestidoLisa(1)-Tol && Imagem(j,k,1) <= VestidoLisa(1)+Tol)
                  ContVestidoLisa = ContVestidoLisa + 1;
          
            elseif ( Imagem(j,k,1) >= ColarLisa(1)-Tol && Imagem(j,k,1) <= ColarLisa(1)+Tol)                    
                    ColarLisa = ColarLisa + 1;
            
   
            elseif(Imagem(j, k, 1) >= RoupaMeggie(1)-Tol && Imagem(j,k,1) <= RoupaMeggie(1)+Tol)
                  ContRoupaMeggie = ContRoupaMeggie + 1;
          
            elseif ( Imagem(j,k,1) >= ChupetaMeggie(1)-Tol && Imagem(j,k,1) <= ChupetaMeggie(1)+Tol)
                  ContChupetaMeggie = ContChupetaMeggie + 1;
             
            
            elseif(Imagem(j, k, 1) >= CabeloMarge(1)-Tol && Imagem(j,k,1) <= CabeloMarge(1)+Tol)
                  ContCabeloMarge = ContCabeloMarge + 1;
          
            
            elseif (Imagem(j, k, 1) >= VestidoMarge(1)-Tol && Imagem(j,k,1) <= VestidoMarge(1)+Tol)
                  ContCabeloMarge = ContCabeloMarge + 1;
            
            end
        end
    end
    
    
     % ----------------NORMALIZACAO DAS CARACTERISTICAS---------------
     
    NumTotalPixels = NumLin * NumCol;

    % Normaliza  os valores pelo numero total de pixels na imagem
    ContCamisaBart  = ContCamisaBart / NumTotalPixels; 
    ContShortsBart = ContShortsBart / NumTotalPixels;
    
    ContBarbaHomer  = ContBarbaHomer / NumTotalPixels; 
    ContSapatoHomer  = ContSapatoHomer / NumTotalPixels;
    
    ContVestidoLisa  = ContVestidoLisa / NumTotalPixels; 
    ContColarLisa = ContColarLisa / NumTotalPixels;
    
    ContRoupaMeggie  = ContRoupaMeggie / NumTotalPixels; 
    ContChupetaMeggie = ContChupetaMeggie / NumTotalPixels;
 
    ContVestidoMarge = ContVestidoMarge / NumTotalPixels;
    ContCabeloMarge = ContCabeloMarge / NumTotalPixels;    
    
    %Salvar no arquivo
    
    fprintf(vetCaracteristicaASCII, '%f %f %f %f %f %f %f %f %f %f %d\n', ContCamisaBart, ContShortsBart, ContBarbaHomer, ContSapatoHomer, ContVestidoLisa, ContColarLisa, ContRoupaMeggie, ContChupetaMeggie, ContCabeloMarge, ContVestidoMarge, Marge);  
    
end            

%%

fclose (vetCaracteristicaASCII);
