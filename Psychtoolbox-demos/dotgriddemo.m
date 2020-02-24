% clear workspace and screen
sca;
close all;
clearvars;

% use default settings of Psychtoolbox
PsychDefaultSetup(2);

% seed rng
rand( 'seed', sum(100 * clock) );

% get screen numbers
screens = Screen('Screens');

% use external display
screenNumber = max(screens);

% define [black = 0; white = 1]
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

% open a screen window + color it black
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black);

% get size of on-screen window in pixels
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% get center coordinate of window in pixels
[xCenter, yCenter] = RectCenter(windowRect);

% enable alpha blending for anti-aliasing
Screen('BlendFunction', window, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

% use meshgrid to create base dot coordinates
dim = 10;
[x, y] = meshgrid(-dim: 1 : dim, -dim: 1 : dim);

% scale grid into pixel coordinates by using screen size
pixelScale = screenYpixels / (dim * 2 + 2);
x = x .* pixelScale;
y = y .* pixelScale;

% calculate the number of dots
numDots = numel(x);

% make matrix of positions for dots
dotPositionMatrix = [ reshape(x, 1, numDots); reshape(y, 1, numDots) ];

% define center of dot coordinates to be relative to
dotCenter = [xCenter yCenter];

% set color of dot to random
dotColors = rand(3, numDots) .* white;

% set size of dots randomly bw 10 and 30 pixels
dotSizes = rand(1, numDots) .* 20 + 10;

% draw all dots to screen in 1 line
Screen('DrawDots', window, dotPositionMatrix, ...
    dotSizes, dotColors, dotCenter, 2);

% flip to the screen
Screen('Flip', window);

% terminate with keyboard button press
KbStrokeWait;

% clear the screen
sca;

















