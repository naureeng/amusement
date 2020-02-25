% clear workspace and screen
sca;
close all;
clearvars;

% set up Psychtoolbox with default settings
PsychDefaultSetup(2);

% get screen nums
screens = Screen('Screens');

% put on external display
screenNumber = max(s
creens);

% define black and white
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

% open an on-screen window
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black);

% get size of on-screen window
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% query frame duration
ifi = Screen('GetFlipInterval', window);

% get center coordinate of the window
[xCenter, yCenter] = RectCenter(windowRect);

% make a base rect of 200 x 200 pixels
baseRect = [0 0 200 200];

% parameters of sine function for oscillation
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

% loop animation until a key is pressed
while ~KbCheck
    
    % position square on frame
    xpos = amplitude * sin(angFreq * time + startPhase);
    
    % use x-pos of square to det its color
    colorMultiplier = abs(xpos) / amplitude;
    
    % anchor in screen coordinates (center)
    squareXpos = xCenter + xpos;
    
    % center rectangle on screen 
    centeredRect = CenterRectOnPointd(baseRect, squareXpos, yCenter);
    
    % draw rect to screen
    Screen('FillRect', window, [1-colorMultiplier 0 colorMultiplier],...
        centeredRect);
    
    % flip to screen
    vbl = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);
    
    % increment the time
    time = time + ifi;
    
end

% clear screen
sca;




















