function result = imageInstruct(wptr, prefix, ext, nPics)

% 默认结果为成功
result = 1;

% 统一按键名字
KbName('UnifyKeyNames');

spaceKey = KbName('space');
escapeKey = KbName('escape');

for i = 1:nPics

    % 生成图片文件名，例如 start1.png
    filename = sprintf('%s%d.%s', prefix, i, ext);

    % 检查图片是否存在
    if ~exist(filename, 'file')
        fprintf('找不到图片文件：%s\n', filename);
        result = -1;
        return;
    end

    % 读取图片
    img = imread(filename);

    % 转成 texture
    tex = Screen('MakeTexture', wptr, img);

    % 画图片
    Screen('DrawTexture', wptr, tex);

    % 显示图片
    Screen('Flip', wptr);

    % 等待按键
    while 1
        [keyIsDown, ~, keyCode] = KbCheck;

        if keyIsDown

            if keyCode(escapeKey)
                result = -1;
                Screen('Close', tex);
                return;

            elseif keyCode(spaceKey)
                Screen('Close', tex);
                KbReleaseWait;
                break;
            end

        end
    end
end

end