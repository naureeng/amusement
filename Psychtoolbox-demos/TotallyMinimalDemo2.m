% clear workspace and screen
sca;
close all;
clearvars;

% set up default settings for Pscyhtoolbox
PsychDefaultSetup(2);


% get screen numbers [0 = native display, 1 = connected display]
screens = Screen('Screens');

% use this line to display on [1 = connected display]
screenNumber = max(screens);

% define [0 = black, 1 = white]
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

% define grey
grey = white / 2;

% open on screen window + color it grey
[window, windowRect] = PsychImaging( 'OpenWindow', screenNumber, grey);

% query window properties
rect = Screen('Rect', window);

% get size of on-screen window in pixels, last two numbers in "windowRect"
% and "rect"
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% get centre coordinate of window in pixels
% xCenter = screenXpixels / 2;
% yCenter = screenYPixels / 2;
[xCenter, yCenter] = RectCenter(windowRect);

% query the inter-frame interval (minimum possible time between drawing to
% the screen)
ifi = Screen('GetFlipInterval', window);

% refresh rate of screen (ifi = 1 / hertz)
hertz = FrameRate(window);

% refresh rate of screen reported by video card
nominalHertz = Screen('NominalFrameRate', window);

% pixel size
pixelSize = Screen('PixelSize', window);

% display size in mm as reported by OS
[width, height] = Screen('DisplaySize', screenNumber);

% maximum coded luminance level 
maxLum = Screen('ColorRange', window);

% wait for keyboard button press to exit
KbStrokeWait;

% clear screen
% sca = "Screen CloseAll"
sca;













