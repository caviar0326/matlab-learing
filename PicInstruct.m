clear all;
KbName ('UnifyKeyNames');
try
    wptr=Screen('OpenWindow',0,255, [50,50,850, 600]) ;
    if imageInstruct(wptr, 'start','jpg',1)<0
        sca;
        return;
    end
    sca;
catch
    sca;
    psychrethrow(psychlasterror);
    
end
return;
