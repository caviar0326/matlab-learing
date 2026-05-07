[wPtr,wRect]=Screen('OpenWindow',0,128);
imgArray=imread('1.jpg');
texid=Screen('MakeTexture',wPtr,imgArray);

dstRect = CenterRectOnPointd( ScaleRect(Screen('Rect', texid), 5, 5), wRect(3)/2, wRect(4)/2);
Screen('DrawTexture', wPtr, texid, [], dstRect);


Screen('Flip',wPtr);
KbStrokeWait;
Screen('CloseAll');