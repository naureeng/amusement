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

% open on-screen window
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, white);

% get size of on-screen window
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% set blend function for alpha blending
Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');

% get center coordinate of window
[xCenter, yCenter] = RectCenter(windowRect);

% make a base rect of 400 x 400 pixels
baseRect = [ 0 0 400 400 ];

% screen X positions of 3 rects
squareXpos = [xCenter-200 xCenter+200 xCenter];
squareYpos = [yCenter yCenter yCenter+200];
numSquares = length(squareXpos);

% set R G B colors
allColors = [1 0 0 1; 0 1 0 1; 0 0 1 0.5]';

% make rect coordinates
allRects = nan(4,3);
for i = 1 : numSquares
    allRects(:, i) = CenterRectOnPointd(baseRect, ...
        squareXpos(i), squareYpos(i));
end

% draw rect to screen
Screen('FillRect', window, allColors, allRects);

% flip screen
Screen('Flip', window);

% wait for a key press
KbStrokeWait;

% clear screen
sca;








