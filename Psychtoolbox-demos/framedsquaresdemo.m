% clear workspace and screen
sca;
close all;
clearvars;

% call up default settings for Psychtoolbox
PsychDefaultSetup(2);

% get screen numbers
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

% get center coordinate of window
[xCenter, yCenter] = RectCenter(windowRect);

% make a base rect of 200 x 200 pixels
baseRect = [0 0 200 200];

% screen X positions of our three rectangles
squareXpos = [screenXpixels * 0.25 screenXpixels * 0.5 screenXpixels * 0.75];
numSquares = length(squareXpos);

% set colors to R G B
allColors = [1 0 0; 0 1 0; 0 0 1];

% make rectangle coordinates
allRects = nan(4,3);
for i = 1:numSquares
    allRects(:, i) = CenterRectOnPointd(baseRect, squareXpos(i), yCenter);
end

% pen width for the frames
penWidthPixels = 6;

% draw rect to screen
Screen('FrameRect', window, allColors, allRects, penWidthPixels);

% flip screen
Screen('Flip', window);

% wait for a keyboard press
KbStrokeWait;


% clear screen
sca;






