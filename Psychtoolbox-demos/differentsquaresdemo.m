% clear workspace and screen
sca;
close all;
clear;

% call up default settings for Psychtoolbox
PsychDefaultSetup(2);
Screen('Preference', 'SkipSyncTests', 1);

% get screen numbers
screens = Screen('Screens');

% put on external display
screenNumber = max(screens);

% define black and white
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

% open on screen window
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black);

% get the size of the on screen window
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% get the center coordinate of the window
[xCenter, yCenter] = RectCenter(windowRect);

% make a base rect of 200 by 200 pixels
baseRect = [0 0 200 200];

% Screen X positions of our 3 rectangles
squareXpos = [screenXpixels * 0.25 ...
    screenXpixels * 0.5 screenXpixels * 0.75];
numSquares = length(squareXpos);

% set colors to R G B
allColors = [1 0 0; 0 1 0; 0 0 1];

% make a multiplier to modulate size of our squares
sizeChanger = [0.7 1 1.3];

% make our rectangle coordinates
allRects = nan(4, 3);
for i = 1 : numSquares
    allRects(:, i) = CenterRectOnPointd( baseRect .* sizeChanger(i), ...
        squareXpos(i), yCenter);
end

% draw rect to screen
Screen('FillRect', window, allColors, allRects);

% flip screen
Screen('Flip', window);

% wait for key press
KbStrokeWait;

% clear screen
sca;







