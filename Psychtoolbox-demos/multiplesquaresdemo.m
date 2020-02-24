% clear workspace and screen
sca;
close all;
clearvars;

% use default settings to set up Psychotoolbox
PsychDefaultSetup(2);

% get screen numbers
screens = Screen('Screens');

% use external display
screenNumber = max(screens);

% define black and white
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

% open screen window
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black);

% get size of the on screen window
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% get the center coordinate of the window
[xCenter, yCenter] = RectCenter(windowRect);

% make a base rect of 200 by 200 pixels
baseRect = [0 0 200 200];

% Screen X positions of our three rectangles
squareXpos = [screenXpixels * 0.25 screenXpixels * 0.5 screenXpixels * 0.75];
numSquares = length(squareXpos);

% set colors to R G B
allColors = [1 0 0; 0 1 0; 0 0 1];

% make rectangle coordinates
allRects = nan(4, 3);
for i = 1 : numSquares
    allRects(:, i) = CenterRectOnPointd(baseRect, squareXpos(i), yCenter);
end

% draw rect to screen
Screen('FillRect', window, allColors, allRects);

% flip screen
Screen('Flip', window);

% wait for keystroke press
KbStrokeWait;

% clear screen
sca;












