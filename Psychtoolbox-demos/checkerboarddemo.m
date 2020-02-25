% clear workspace and screen
sca;
close all;
clearvars;


% call default settings for Psychtoolbox
PsychDefaultSetup(2);

% get screen numbers
screens = Screen('Screens');

% use external display
screenNumber = max(screens);

% define black and white
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);
grey  = white / 2;

% open on-screen window
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, grey);

% get size of on-screen window
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% get center coordinate of window
[xCenter, yCenter] = RectCenter(windowRect);

% make a base rect of 200 x 200 pixels
dim = 50;
baseRect = [0 0 dim dim];

% make coordinates for our grid of squares
[xPos, yPos] = meshgrid(-2:1:2, -2:1:2);

% calculate num of squares and reshape matrices of coordinates into a
% vector
[s1, s2] = size(xPos);
numSquares = s1 * s2;
xPos = reshape(xPos, 1, numSquares);
yPos = reshape(yPos, 1, numSquares);

% scale the grid spacing to the size of our squares and center
xPosLeft = xPos .* dim + screenXpixels * 0.25;
yPosLeft = yPos .* dim + yCenter;

xPosRight = xPos .* dim + screenXpixels * 0.75;
yPosRight = yPos .* dim + yCenter;

% set the colors of each of our squares
multiColors = rand(3, numSquares);
bwColors = repmat(eye(2), 3, 3);
bwColors = bwColors(1:end-1, 1:end-1);
bwColors = reshape(bwColors, 1, numSquares);
bwColors = repmat(bwColors, 3, 1);

% make our rectangle coordinates
allRectsLeft = nan(4, 3);
allRectsRight = nan(4, 3);
for i = 1 : numSquares
    allRectsLeft(:, i) = CenterRectOnPointd(baseRect, ...
        xPosLeft(i), yPosLeft(i));
    allRectsRight(:, i) = CenterRectOnPointd(baseRect, ...
        xPosRight(i), yPosRight(i));
end

% draw rect to screen
Screen('FillRect', window, [multiColors bwColors], ...
    [allRectsLeft allRectsRight]);

% flip to screen
Screen('Flip', window);

% wait for a key press
KbStrokeWait;

% clear screen
sca;


















