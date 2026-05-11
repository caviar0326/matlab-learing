KbName('UnifyKeyNames');
ListenChar(2);

fKey=KbName('f');
escapeKey=KbName('escape');

startTime=GetSecs;

while 1
    [kD, secs, kC]=KbCheck;
    
    if kD
    RT=secs-startTime;
    if kC(fKey)
        accuracy=1;
        responseKey='f';
    elseif kC(escapeKey)
        return;
    else
        accuracy=0;
        responseKey=char(KbName(kC));
    end
    
    break;
    end
end

fprintf('你按了：%s\n', responseKey);
fprintf('反应时RT：%.4f秒\n', RT);
fprintf('正确率accuracy:%d\n',accuracy);
ListenChar(0)