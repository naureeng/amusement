% clear workspace and screen
sca;
close all;
clearvars;

% set up default settings for Psychtoolbox
PsychDefaultSetup(2);

% get screen numbers
screens = Screen('Screens');

% display on external screen
screenNumber = max(screens);

% define [black = 0; white = 1]
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

% open on-screen window
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black);

% get size of on-screen window
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% query frame duration
ifi = Screen('GetFlipInterval', window);

% set-up text type for window
Screen('TextFont', window, 'Arial');
Screen('TextSize', window, 50);

% get centre coordinate of window
[xCenter, yCenter] = RectCenter( windowRect );

% set initial position of mouse to a random position on the screen
SetMouse( round(rand * screenXpixels), round(rand * screenYpixels), window );

% set mouse to top left of screen to start
SetMouse( 0 , 0, window );

% loop animation until a key is pressed
while ~KbCheck
    
    % get current position of mouse
    [x, y, buttons] = GetMouse( window );
    
    % clamp values at maximum values of screen in X and Y
    x = min(x, screenXpixels);
    y = min(y, screenYpixels);
    
    % construct text string
    textString = ['Mouse at X pixel' num2str( round(x) ) ...
        ' and Y pixel' num2str( round(y) )];
    
    % text output of mouse position draw in the center of the screen
    DrawFormattedText( window, textString, 'center', 'center', white);
    
    % draw white dot where the mouse cursor is
    Screen('DrawDots', window, [x y], 10, white, [], 2);
    
    % flip to screen
    Screen('Flip', window);
end

% clear screen
sca;










