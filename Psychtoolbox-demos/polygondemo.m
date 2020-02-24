% Clear the workspace and the screen
sca;
close all;
clearvars;

% Here we call some default settings for setting up Psychtoolbox
PsychDefaultSetup(2);

% Get the screen numbers
screens = Screen('Screens');

% Draw to the external screen if avaliable
screenNumber = max(screens);

% Define black and white
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

% Open an on screen window

[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black);

% get size of on-screen window
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% get center coordinate of window
[xCenter, yCenter] = RectCenter(windowRect);

% num of sides for polygon
numSides = 7;

% vertices of polygon
anglesDeg = linspace(0, 360, numSides + 1);
anglesRad = anglesDeg * (pi / 180);
radius = 200;

% X and Y coordinates of polygon
yPosVector = sin(anglesRad) .* radius + yCenter;
xPosVector = cos(anglesRad) .* radius + xCenter;

% set color of rect to red
rectColor = [1 0 0];

% cue that polygon is convex
isConvex = 1;

% draw rect to screen
Screen('FillPoly', window, rectColor, [xPosVector; yPosVector]', isConvex);

% flip to screen
Screen('Flip', window);

% wait for a key press
KbStrokeWait;

% clear screen
sca;











