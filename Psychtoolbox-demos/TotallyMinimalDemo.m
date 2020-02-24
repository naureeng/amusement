% clear the workspace and the screen
sca; % specific to Psychtoolbox
close all;
clearvars;

% default settings to set up Psychtoolbox
PsychDefaultSetup(2);

% get screen numbers to have a number for each of the screens attached to
% our computer
screens = Screen('Screens');

% if 2 monitors are attached, this line helps display to 1 of 2 screens
screenNumber = max(screens);

% define black and white (white = 1; black = 0)
% luminance values are defined bw 0 and 1 with 255 steps in between
% all values in Psychtoolbox are defined bw 0 and 1
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

% luminance value for grey = 1/2 luminance value for white
grey = white / 2;

% open an on-screen window using PsychImaging and color it grey
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, grey);

% allow any keyboard button press to terminate the demo
KbStrokeWait;

% clear screen;
sca;
