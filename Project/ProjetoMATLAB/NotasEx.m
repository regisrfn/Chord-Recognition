frequencia = [195 131 122];

N = 0:131;
freqFund = vpa(16.351597,8);
frequencias = vpa(freqFund*2.^(N/12),8);

notas = cellstr(['C ';'C#';'D ';'D#';'E ';'F ';'F#';'G ';'G#';'A ';'A#';'B ']);
nota = cellstr(char(1,length(frequencia)));

for i = 1:length(frequencia)
    
    freqDesejada = frequencia(i);
    x = find(frequencias <= freqDesejada + 4 & frequencias >= freqDesejada - 4);
    
    if(~isempty(x))          
        
        indice = mod(x+12,12);
        
        if(indice == 0)
            indice = 12;
        end        
        
    end
    
    nota(i) = notas(indice);
    
end

