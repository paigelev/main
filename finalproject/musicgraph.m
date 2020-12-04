function [graph,a,b] = musicgraph(music)
%MUSICGRAPH returns the graph of music played on a piano
%   The function takes the input of all notes played and produces a graph
%   of the soundwaves of the chord or key played
x = 0:0.0001:.01;
a = 27.5;
allnotes=["A" "A#" "B" "C" "C#" "D" "D#" "E" "F" "F#" "G" "G#"];
if strlength(music)>3
%if length >3, multiple keys played
%need to separate music then add equations together
    notes = regexp(music,'\w\d|\w#\d','match');
    y = 0;
    h = size(notes);
    for i = 1:(h(2))
       n = find(notes{i}(1) == allnotes);
       if n == 1
           b = 2*pi;
       else
           b = (2*pi)*(1.05946.^(n-1));
       end
       if notes{i}(2)=="#"
           %sharp note so b needs to be multiplied by 1.05946 again
           b = b*1.05946;
           octave = str2double(notes{i}(3));
       else
           octave = str2double(notes{i}(2));
       end
       a = a*(2^octave);
       eq = sin(a*b*x);
       %when multiple keys played equations of each note are added together
       y = y + eq;
       
    end
    graph = plot(x,y);
    xlabel('Time');
    ylabel('Amplitude');
    title('Soundwave of Music Played on Piano');
    disp(a)
    disp(b)
    disp(size(notes))
    disp(notes)

else
    sepnote = split(music,"");
    %gives "" at beginning and end
    n = find(sepnote(2) == allnotes);
       if n == 1
           b = 2*pi;
       else
           b = (2*pi)*(1.05946.^(n-1));
       end
       if sepnote(3)=="#"
           %it is a sharp note so b multiplied by 1.05946 again
           b = b*1.05946;
           octave = str2double(sepnote(4));
       else
           octave = str2double(sepnote(3));
       end
       a = a*(2^octave);
       y = sin(a*b*x);
       graph = plot(x,y);
       xlabel('Time');
       ylabel('Amplitude');
       title('Soundwave of Music Played on Piano');
       disp(a)
       disp(b)

end

end


