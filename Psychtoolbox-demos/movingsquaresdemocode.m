% clear workspace and screen
sca;
close all;
clearvars;

% call up some default settings for Psychtoolbox
PsychDefaultSetup(2);

% get screen nums
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

% query frame duration
ifi = Screen('GetFlipInterval', window);

% get the center coordinate of the window
[xCenter, yCenter] = RectCenter(windowRect);

% make a base rect of 200 x 200 pixels
baseRect = [0 0 200 200];

% set color of top rect to R and bot rect to B
topColor = [1 0 0];
bottomColor = [0 0 1];

% parameters for sine wave oscillation
amplitude = screenXpixels * 0.25;
frequency = 0.2;
angFreq = 2 * pi * frequency;
time = 0;

% our two squares will be pi - out of phase
startPhaseOne = 0;
startPhaseTwo = pi;

% sync + get a time stamp
vbl = Screen('Flip', window);
waitframes = 1;

% maximum priority level
topPriorityLevel = MaxPriority(window);
Priority(topPriorityLevel);

% loop until a key is pressed
while ~KbCheck
    
    % position of two squares on this frame
    xposOne = amplitude * sin(angFreq * time + startPhaseOne);
    xposTwo = amplitude * sin(angFreq * time + startPhaseTwo);
    
    % add this point to screen center coordinate
    % this will be anchor point
    squareXposOne = xCenter + xposOne;
    squareXposTwo = xCenter + xposTwo;
    
    % center rectangle on center of screen
    centeredRectOne = CenterRectOnPointd(baseRect, squareXposOne, ...
        screenYpixels * 0.25);
    centeredRectTwo = CenterRectOnPointd(baseRect, squareXposTwo, ...
        screenYpixels * 0.75);
    
    % draw rect to screen
    Screen('FillRect', window, [topColor' bottomColor'], ...
        [centeredRectOne' centeredRectTwo']);
    
    % flip to screen
    vbl = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);
    
    % increment time
    time = time + ifi;
end

% clear screen
sca;


    




















