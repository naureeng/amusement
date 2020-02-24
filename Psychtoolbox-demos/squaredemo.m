% clear workspace and screen
sca;
close all;
clearvars;

% use default settings of Pyschtoolbox
PsychDefaultSetup(2);

% get screen numbers
screens = Screen('Screens');

% use external display
screenNumber = max(screens);

% define [black = 0; white = 1]
black = BlackIndex( screenNumber );

% open on-screen window + color it black
[window, win
    dowRect] = PsychImaging('OpenWindow', screenNumber, black);

% get size of on-screen window in pixels
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% get center coordinate of window in pixels
[xCenter, yCenter] = RectCenter( windowRect );

% create baseRect (200 x 200 pixels)
baseRect = [0 0 200 200];

% center the rectangle on center of screen
centeredRect = CenterRectOnPointd(baseRect, xCenter, yCenter);

% set RGB color
rectColor = [1 0 0];

% draw square to screen
Screen('FillRect', window, rectColor, centeredRect);

% flip to screen
Screen('Flip', window);

% terminate with keyboard stroke
KbStrokeWait;

% clear screen
sca;


