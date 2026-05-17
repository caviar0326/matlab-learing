 clear all;
KbName('UnifyKeyNames');
Screen('Preference','SkipSyncTests',1);

try
    % 打开窗口
    wptr = Screen('OpenWindow', 0, 255,[50 50 850 600]);
  
    % 设置图片数量
    nPics = 3;

    % 获取空格键编号
    spaceKey = KbName('space');
    escapeKey = KbName('escape');           

    for i = 1:nPics %一张张显示图片
        filename = ['start' num2str(i) '.jpg']; % 生成图片文件名
        fprintf('正在显示：%s\n', filename);   

        img = imread(filename);
        tex=Screen('MakeTexture',wptr,img);

        Screen('DrawTexture', wptr, tex);
        Screen('Flip', wptr);

        
        while 1
            [keyIsDown, ~, keyCode] = KbCheck; %等待按键

            if keyIsDown

                if keyCode(spaceKey)

                    while KbCheck  % 等待空格松开，避免一次空格跳过两张
                        WaitSecs(0.01);
                    end

                    Screen('Close',tex);  %关闭 / 释放这个 texture 占用的显卡资源
                    break;

                elseif keyCode(escapeKey)
                    Screen('Close',tex);
                    sca;
                    return;
                end

            end
        end
    end
    sca;

catch
    sca;
    rethrow(psychlasterror);
end