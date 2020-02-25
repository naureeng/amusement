% clear workspace and screen
sca;
close all;
clearvars;

% call up default settings of Psychtoolbox
PsychDefaultSetup(2);

% get screen numbers
screens = Screen('Screens');

% put on external display
screenNumber = max(screens);

% define black and white
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

% open an on-screen window
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black);

% get size of on-screen window
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% query the frame duration
ifi = Screen('GetFlipInterval', window);

% get center coordinate of window
[xCenter, yCenter] = RectCenter(windowRect);

% make a base rect of 200 by 200 pixels
baseRect = [0 0 200 200];

% define red
red = [1 0 0];

% set initial position of mouse to be in center of screen
SetMouse(xCenter, yCenter, window);

% set squares initial position to center of screen
sx = xCenter;
sy = yCenter;
centeredRect = CenterRectOnPointd(baseRect, sx, sy);

% offset toggle
offsetSet = 0;

% sync + get a time stamp
vbl = Screen('Flip', window);
waitframes = 1;

% maximum priority level
topPriorityLevel = MaxPriority(window);
Priority(topPriorityLevel);

% loop animation until a key is pressed
while ~KbCheck
    
    % get current position of mouse
    [mx, my, buttons] = GetMouse(window);
    
    % find central position of square
    [cx, cy] = RectCenter(centeredRect);
    
    % see if mouse cursor is inside square
    inside = IsInRect(mx, my, centeredRect);
    
    
    % sync mouse cursor and square movement
    if inside==1 && sum(buttons) > 0 && offsetSet == 0
        dx = mx - cx;
        dy = my - cy;
        offsetSet = 1;
    end
    
    if inside==1 && sum(buttons) > 0
        sx = mx - dx;
        sy = my - dy;
    end
    
    % center rectangle on its new screen position
    centeredRect = CenterRectOnPointd(baseRect, sx, sy);
    
    % draw rect to screen
    Screen('FillRect', window, red, centeredRect);
    
    % draw white dot where mouse cursor is
    Screen('DrawDots', window, [mx my], 10, white, [], 2);
    
    % flip screen
    vbl = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);
    
    % check if mouse button has been released + if so, reset the offset cue
    if sum(buttons) <= 0
        offsetSet = 0;
    end
    
end

% clear the screen
sca;


    
        
        
    
    
    






















