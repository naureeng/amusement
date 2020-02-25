% clear workspace and screen
sca;
close all;
clearvars;

% call up default settings for Psychtoolbox
PsychDefaultSetup(2);

% get screen nums
screens = Screen('Screens');

% use external display
screenNumber = max(screens);

% define black and white
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

% open on-screen window + color it black
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black);

% get size of on-screen window in pixels
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% get center coordinate of window in pixels
[xCenter, yCenter] = RectCenter(windowRect);

% make base rect of 200 x 200 pixels
baseRect = [0 0 200 200];

% center left hand side squares on positions in the screen
leftBackRect = CenterRectOnPointd(baseRect, screenXpixels * 0.25, yCenter);
leftForwardRect = CenterRectOnPointd(baseRect, ...
    screenXpixels * 0.25 + 100, yCenter + 100);

% add in right-hand squares
rightBackRect = CenterRectOnPointd(baseRect, ...
    screenXpixels * 0.75, yCenter);
rightForwardRect = CenterRectOnPointd(baseRect, ...
    screenXpixels * 0.75 + 100, yCenter + 100);
rightRects = [rightBackRect; rightForwardRect]';

% color of rects
rightRectColors = [1 0 0; 0 1 0]';

% draw left-hand squares one-by-one
Screen('FillRect', window, [1 0 0], leftBackRect);
Screen('FillRect', window, [0 1 0], leftForwardRect);

% draw right-hand squares at same time
Screen('FillRect', window, rightRectColors, rightRects);

% flip screen
Screen('Flip', window);

% wait for key press
KbStrokeWait;

% clear screen
sca;





