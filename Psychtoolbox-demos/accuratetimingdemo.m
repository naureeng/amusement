% clear workspace and screen
sca;
close all;
clearvars;

% call default settings for Psychtoolbox
PsychDefaultSetup(2);

% get screen numbers
screens = Screen('Screens');

% chose external display screen
screenNumber = max(screens);

% define [black = 0; white = 1]
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

% define grey
grey = white / 2;

% open an on-screen window + color it grey
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, grey);

% measure vertical refresh rate of monitor
ifi = Screen('GetFlipInterval', window);

% retrieve maximum priority number
topPriorityLevel = MaxPriority(window);

% length of time and number of frames we will use for each drawing test
numSecs = 1;
numFrames = round( numSecs / ifi );

% number of frames to wait when specifiying flip 
% i.e. waitframes = 2 will flip on every other frame
waitframes = 1;

%% Example # 1 : present stimuli on screen with much left to chance . . .
for frame = 1 : numFrames
    
    % color the screen grey
    Screen('FillRect', window, [0.5 0.5 0.5]);
    
    % flip to screen
    Screen('Flip',window);
    
end

%% Example # 2: use 0.5 as inter-frame interval + have Psychtoolbox [PTB]
%  use a specified timing
vbl = Screen('Flip',window);
for frame = 1 : numFrames
    
    % color the screen red
    Screen('FillRect', window, [0.5 0 0]);
    
    % flip to the screen
    vbl = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);
    
end

%% Example # 3: set PTB as top priority in processes (advised to place in start of scripts)
Priority(topPriorityLevel);
vbl = Screen('Flip', window);
for frame = 1 : numFrames
    
    % color the screen purple
    Screen('FillRect', window, [0.5 0 0.5]);
    
    % flip to the screen
    vbl = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);
    
end
Priority(0);

%% Example # 4: tell PTB no more drawing commands will be given bw color screen and flipping
Priority(topPriorityLevel);
vbl = Screen('Flip', window);
for frame = 1 : numFrames
    
    % color the screen blue
    Screen('FillRect', window, [0 0 0.5]);
    
    % tell PTB no more drawing commands will be issued until next flip
    Screen('DrawingFinished', window);
    
    % flip to screen
    vbl = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);
    
end
Priority(0);

% clear the screen
sca;







