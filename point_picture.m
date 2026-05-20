clear all;
KbName('UnifyKeyNames');
Screen('Preference','SkipSyncTests',1);

try
    wptr = Screen('OpenWindow', 0, 255, [50 50 850 600]);

    nPics = 3;

    order = randperm(nPics);

    Screen('TextSize', wptr, 50); 

    for trial = 1:nPics

        picNumber = order(trial);
        filename = ['start' num2str(picNumber) '.jpg'];

        DrawFormattedText(wptr, '+', 'center', 'center', 0);  %呈现注视点 2 秒
        Screen('Flip', wptr);
        WaitSecs(2);

        img = imread(filename); %呈现图片 2 秒

        tex = Screen('MakeTexture', wptr, img);

        Screen('DrawTexture', wptr, tex);
        Screen('Flip', wptr);

        WaitSecs(2);

        Screen('Close', tex);  %关闭当前图片纹理

    end

    sca;

catch
    sca;
    psychrethrow(psychlasterror);
end