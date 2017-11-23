function [result] = verificaAcorde(input1,input2,input3,notasDoAcorde)

nota = [0,0,0];
result = false;

x = find(strcmp(notasDoAcorde,input1), 1);

if(~isempty(x))
    nota(1) = x;
end

x = find(strcmp(notasDoAcorde,input2), 1);

if(~isempty(x))
    nota(2) = x;
end

x = find(strcmp(notasDoAcorde,input3), 1);

if(~isempty(x))
    nota(3) = x;
end


if(ismember([1,2,3],nota))
    result = true;
end


end



