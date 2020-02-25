% clear workspace and screen
sca;
close all;
clearvars;

% call up default settings of Psychtoolbox
PsychDefaultSetup(2);

% seed rng
rand('seed', sum(100 * clock));

% get screen nums
screens = Screen('Screens');

% use external display
screenNumber = max(screens);

% define black and white
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

% open on-screen window + color it black
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black);

% get size of on-screen window in pixels
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% get center coordinate of windo in pixels
[xCenter, yCenter] = RectCenter(windowRect);

% enable alpha blending for anti-aliasing
Screen('BlendFunction', window, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

% query frame duration
ifi = Screen('GetFlipInterval', window);

% use meshgrid to create our base dot coordinates
dim = 10;
[x, y] = meshgrid( -dim:1:dim, -dim:1:dim );

% scale meshgrid to screen size
pixelScale = screenYpixels / (dim * 2 + 2);
x = x .* pixelScale;
y = y .* pixelScale;

% calculate number of dots
numDots = numel(x);

% make matrix of positions for dots into two vectors
xPosVector = reshape(x, 1, numDots);
yPosVector = reshape(y, 1, numDots);

% define dot center
dotCenter = [screenXpixels/2 screenYpixels/2];

% set color of dot to be random
dotColors = rand(3, numDots);

% set size of dot randomly bw 10 and 30 pixels
dotSizes = rand(1, numDots) .* 20 + 10;

% grid will oscillate as a sine wave to L and R
amplitude = screenYpixels * 0.25;
frequency = 0.2;
angFreq = 2 * pi * frequency;
startPhase = 0;
time = 0;

% sync + get time stamp
vbl = Screen('Flip', window);
waitframes = 1;

% max priority level
topPriorityLevel = MaxPriority(window);
Priority(topPriorityLevel);

% loop animation until key is pressed
while ~KbCheck
    
    % position of square on this frame
    gridPos = amplitude * sin(angFreq * time + startPhase);
    
    % draw dots to screen using sine oscillation
    Screen('DrawDots', window, [xPosVector + gridPos; yPosVector], ...
        dotSizes, dotColors, dotCenter, 2);
    
    % flip screen
    vbl = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);
    
    % increment time
    time = time + ifi;
    
end

% clear screen
sca;













































