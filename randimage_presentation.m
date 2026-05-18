clear all;
KbName('UnifyKeyNames');
Screen('Preference','SkipSyncTests',1);

try
    wptr=Screen('Openwindow',0,255,[50 50 850 600]);

    nPics=3;
    order = randperm(nPics); %生成一个随机顺序

    spaceKey=KbName('space');
    escapeKey=KbName('escape');  

    
    for trial=1:nPics  % i同时代表第几轮和第几张图片，随即呈现就不能用了；trial表当前是第几轮呈现
        picNumber = order(trial);  %若order[2 3 1], trial 1 →picNumber2
        filename=['start' num2str(picNumber) '.jpg'];  %如上
        img=imread(filename);

        tex=Screen('MakeTexture',wptr,img);
        Screen('DrawTexture',wptr,tex);
        Screen('Flip',wptr);

        while 1
            [keylsDown,~,keyCode]=KbCheck;
            if keylsDown
                if keyCode(spaceKey)
                    while KbCheck
                        WaitSecs(0.1);
                    end
                    Screen('Close',tex);
                    break
                elseif keyCode(escapeKey)
                    Screen('Close',tex);
                    sca
                    return
                end
            end
        end
    end
    sca
catch
sca
psychrethrow(psychlasterror);
end