function [acorde] = reconheceAcorde(notasDoAcorde)


    if(verificaAcorde('C','E','G',notasDoAcorde))
        acorde = 'Acorde C';
        
    elseif(verificaAcorde('C#','B#','D#',notasDoAcorde))
        acorde = 'Acorde C#';
        
    elseif(verificaAcorde('D','F#','A',notasDoAcorde))
        acorde = 'Acorde D';
        
    elseif(verificaAcorde('D#','F','A#',notasDoAcorde))
        acorde = 'Acorde D#';
    
    elseif(verificaAcorde('E','G#','B',notasDoAcorde))
        acorde = 'Acorde E';
    
    elseif(verificaAcorde('F','A','C',notasDoAcorde))
        acorde = 'Acorde F';
        
    elseif(verificaAcorde('F#','A#','C#',notasDoAcorde))
        acorde = 'Acorde F#';
        
    elseif(verificaAcorde('G','B','D',notasDoAcorde))
        acorde = 'Acorde G';
        
    elseif(verificaAcorde('G#','B#','D#',notasDoAcorde))
        acorde = 'Acorde G#';
    
    elseif(verificaAcorde('A','C#','E',notasDoAcorde))
        acorde = 'Acorde A';
        
    elseif(verificaAcorde('A','D','E#',notasDoAcorde))
        acorde = 'Acorde A#';
    
    elseif(verificaAcorde('B','D#','F#',notasDoAcorde))
        acorde = 'Acorde B';
        
    else
        acorde = 'Acorde nao reconhecido';
    end

end