% clear workspace and screen
sca;
close all;
clearvars;

% use default settings of Psychtoolbox
PsychDefaultSetup(2);

% get screen nums
screens = Screen('Screens');

% use external display
screenNumber = max(screens);

% define black and white
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

% open an on-screen window
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black);

% get size of on-screen window
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% query frame duration
ifi = Screen('GetFlipInterval', window);

% get center coordinate of window
[xCenter, yCenter] = RectCenter(windowRect);

% make base rect of 200 x 200 pixels
baseRect = [0 0 200 200];

% set color of rect to red
rectColor = [1 0 0];

% oscillate square as sine wave
% parameters for sine:
amplitude = screenXpixels * 0.25;
frequency = 0.2;
angFreq = 2 * pi * frequency;
startPhase = 0;
time = 0;

% sync + get a time stamp
vbl = Screen('Flip', window);
waitframes = 1;

% max priority level
topPriorityLevel = MaxPriority(window);
Priority(topPriorityLevel);

% loop animation until key is pressed
while ~KbCheck
    
    % position square on frame
    xpos = amplitude * sin(angFreq * time + startPhase);
    
    % create anchor (in screen coords)
    squareXpos = xCenter + xpos;
    
    % center rectangle on center of screen
    centeredRect = CenterRectOnPointd(baseRect, squareXpos, yCenter);
    
    % draw rect to screen
    Screen('FillRect', window, rectColor, centeredRect);
    
    % flip to screen
    vbl = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);
    
    % increment time
    time = time + ifi;
end

% clear screen
sca;































