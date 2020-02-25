% clear workspace and screen
sca;
clear all;
clearvars;

% call up default settings for Psychtoolbox
PsychDefaultSetup(2);

% get screen nums
screens = Screen('Screens');

% put on external display
screenNumber = max(screens);

% define black and white
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

% open on-screen window
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black);

% get size of on-screen window
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% query frame duration
ifi = Screen('GetFlipInterval', window);

% get center coordinate of window
[xCenter, yCenter] = RectCenter(windowRect);

% make base rect of 200 x 200 pixels
baseRect = [0 0 200 200];

% define red and blue
red  = [1 0 0];
blue = [0 0 1];

% set mouse cursor to be on screen center
SetMouse(xCenter, yCenter, window);

% sync + get time stamp
vbl = Screen('Flip', window);
waitframes = 1;

% max priority level
topPriorityLevel = MaxPriority(window);
Priority(topPriorityLevel);

% loop animation until key is pressed
while ~KbCheck
    
    % get current position of mouse
    [x, y, buttons] = GetMouse(window);
    
    % center rectangle on screen monitor
    centeredRect = CenterRectOnPointd(baseRect, xCenter, yCenter);
    
    % see if mouse cursor is inside the square
    inside = IsInRect(x, y, centeredRect);
    
    % if mouse cursor inside, square is red. otherwise square is blue
    if inside == 1
        rectColor = red;
    elseif inside == 0
        rectColor = blue;
    end
    
    % draw rect to screen
    Screen('FillRect', window, rectColor, centeredRect);
    
    % draw white dot where mouse is
    Screen('DrawDots', window, [x y], 10, white, [], 2);
    
    % flip to screen
    vbl = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);
end

% clear the screen
sca;
















