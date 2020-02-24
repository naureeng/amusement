% clear workspace and the screen
sca;
close all;
clearvars;

% set up default settings for Psychtoolbox
PsychDefaultSetup(2);

% get screen numbers
screens = Screen('Screens');

% display on external monitor
screenNumber = max(screens);

% define [black = 0; white = 1]
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

% define grey
grey = white / 2;

% open screen window using PsychImaging and color it grey
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, grey);

% measure vertical refresh rate of the monitor
ifi = Screen('GetFlipInterval', window);

% retrieve maximum priority number and set max priority
topPriorityLevel = MaxPriority(window);
Priority(topPriorityLevel);

% use waitframes > 1 to flip at a rate not equal to monitor's refresh rate
% below is flip : 1 time per second (to the nearest frame)
flipSecs = 1;
waitframes = round(flipSecs / ifi);

% flip outside of loop to get a time stamp
vbl = Screen('Flip', window);

% run until a key is pressed
while ~KbCheck
    
    % color the screen a random color
    Screen('FillRect', window, rand(1, 3));
    
    % flip to the screen
    vbl = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);
    
end

% clear the screen
sca;
