% clear workspace and screen
sca;
close all;
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

% open an on-screen window
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black);

% get size of on-screen window
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% query the frame duration
ifi = Screen('GetFlipInterval', window);

% set up alpha-blending for smooth (anti-aliased) lines
Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');

% set up text type for the window
Screen('TextFont', window, 'Arial');
Screen('TextSize', window, 36);

% get the center coordinate of the window
[xCenter, yCenter] = RectCenter(windowRect);

% set the size of the arms of our fixation cross
fixCrossDimPix = 40;

% set coordinates relative to monitor
xCoords = [-fixCrossDimPix fixCrossDimPix 0 0];
yCoords = [0 0 -fixCrossDimPix fixCrossDimPix];
allCoords = [xCoords; yCoords];

% set the line width for our fixation cross
lineWidthPix = 4;

% draw fixation cross in white
Screen('DrawLines', window, allCoords, ...
    lineWidthPix, white, [xCenter yCenter], 2);

% flip to screen
Screen('Flip', window);

% wait for keyboard press
KbStrokeWait;

% clear the screen
sca;


















