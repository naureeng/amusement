% clear workspace and vars
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

% open on-screen window + color it black
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black);

% get size of on-screen window in pixels
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% get center coordinate of window in pixels
[xCenter, yCenter] = RectCenter(windowRect);

% enable alpha blending for anti-aliasing
Screen('BlendFunction', window, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

% query frame duration
ifi = Screen('GetFlipInterval', window);

% use meshgrid to create base dot coordinates
dim = 10;
[x, y] = meshgrid(-dim:1:dim, -dim:1:dim);

% scale to screen monitor size
pixelScale = screenYpixels / (dim * 2 + 2);
x = x .* pixelScale;
y = y .* pixelScale;

% calc num of dots
numDots = numel(x);

% matrices of dot positions
xPosVector = reshape(x, 1, numDots);
yPosVector = reshape(y, 1, numDots);

% set center of screen to anchor motion
dotCenter = [screenXpixels/2 screenYpixels/2];

% set color of dot to be random
dotColors = rand(3, numDots);

% set max size of dot to 25 pixels
maxDotSize = 25;

% parameters of sine wave
amplitude = 1;
frequency = 0.05;
angFreq = 2 * pi * frequency;
startPhase = 0;
time = 0;

% sync + get a time stamp
vbl = Screen('Flip', window);
waitframes = 1;

% max priority level
topPriorityLevel = MaxPriority(window);
Priority(topPriorityLevel);

% loop animation until a key is pressed
while ~KbCheck
    
    % scale grid coordinates
    scaleFactor = abs( amplitude * sin(angFreq * time + startPhase) );
    
    % scale dot size
    thisDotSize = max( 1, maxDotSize .* scaleFactor);
    
    % draw dots + sine oscillation
    Screen('DrawDots', window, [xPosVector; yPosVector] .* scaleFactor, ...
        thisDotSize, dotColors, dotCenter, 2);
    
    % flip to screen
    vbl = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);
    
    % increment the time
    time = time + ifi;
end

% clear screen
sca;


    
    















