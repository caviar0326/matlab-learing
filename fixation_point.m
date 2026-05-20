clear all;
KbName('UnifyKeyNames');
Screen('Preference','SkipSyncTests',1);

try
    wptr = Screen('OpenWindow', 0, 128, [50 50 850 600]);

    Screen('TextSize', wptr, 50);  %设置注视点字号

    DrawFormattedText(wptr, '+', 'center', 'center', 0);  %在屏幕中央画黑色 “+”；

    Screen('Flip', wptr);

    WaitSecs(2);  %注视点保持时间

    sca;

catch
    sca;
    psychrethrow(psychlasterror);
end