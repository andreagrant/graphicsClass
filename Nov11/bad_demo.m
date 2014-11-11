% simplistic demo of differences between PutImage and DrawTexture
%
% Conceptually, when you want to drift or contrast reverse a grating, each
% frame is a grating with a different phase or a different contrast.  So
% the simple-minded approach is to just get a family of gratings ready and
% then put them up when it's time.  OK for small gratings, but for big (or
% colorful) gratings, that fails (theoretically).  We're setting out to
% prove it fails.
%
clear; close all; clear mex; clear global
% Some parameters to demo different things.
grating_size = 650;
grating_colors = [1 1 1]; % triplet showing weighting of 3 different channels
animation_style = 'PutImage'; % or 'DrawTexture'

% Basic grating ... product of Gaussian and sinusoid
[y x] = meshgrid(1:grating_size,1:grating_size);
y = y-grating_size/2; x = x-grating_size/2;
r = sqrt(x.^2 + y.^2);
gaussian = exp(-r.^2/(2*(grating_size/6)^2));
sinusoid = sin(2*pi*x*(16/grating_size));
basic_grating = gaussian.*sinusoid;

for iPh = 1:16
    sinusoid = sin(2*pi*x*(16/grating_size) + pi*iPh/8);
    grating_stack(:,:,iPh) = gaussian.*sinusoid;
end

% only DrawTexture uses OpenGL, but keep as much the same as possible
AssertOpenGL;
screens=Screen('Screens');
screenNumber=max(screens);
gray = 127; white = 255; black = 0;

movieDuration = 5; % seconds

frameRate = Screen('FrameRate',screenNumber);
% If MacOSX does not know the frame rate the 'FrameRate' will return 0.
% That usually means we run on a flat panel with 60 Hz fixed refresh
% rate:
if frameRate == 0
    frameRate = 60;
end
nFrames = round(movieDuration*frameRate);
frameIndices = mod((1:nFrames)-1,size(grating_stack,3)) + 1;


% After here, it's hard to see what you're doing ...
w = Screen('OpenWindow',screenNumber, gray);
% Use realtime priority for better timing precision:
priorityLevel=MaxPriority(w);
Priority(priorityLevel);

% Here's where I open a movie container
myMoviePointerThatIMightNeed = ...
    Screen('CreateMovie',w,'my_big_fat_movie_file');

switch animation_style
    case 'DrawTexture'
        % prepare textures (store on graphics card?)
        for iG = 1:size(grating_stack,3)
            scaled_grating = min(max(gray + 127*grating_stack(:,:,iG),black),white);
            tex(iG)=Screen('MakeTexture', w,scaled_grating); 
        end
        % Animation loop:
        tic
        for iF = 1:nFrames
            Screen('DrawTexture', w, tex(frameIndices(iF)),[],[],[],[],[],255*grating_colors);
            Screen('Flip', w);
        end
        toc
    case 'PutImage'
        % prepare textures (store on graphics card?)
        for iG = 1:size(grating_stack,3)
            if grating_colors(1) == grating_colors(2) & grating_colors(1) == grating_colors(3)
                % we're black and white
                scaled_gratings(:,:,iG) =  ...
                    min(max(gray + 127*grating_stack(:,:,iG),black),white);
            else
                for iC = 1:length(grating_colors)
                    scaled_gratings(:,:,iG,iC) = ...
                        min(max(gray + 127*grating_stack(:,:,iG)*grating_colors(iC),black),white);
                end
            end
        end
        % Animation loop:
        tic
        for iF = 1:nFrames
            Screen('PutImage', w,squeeze(scaled_gratings(:,:,frameIndices(iF),:)));
            Screen('Flip', w);
            Screen('AddFrameToMovie',w);
        end
        toc
end
Priority(0);
% Save my fancy movie!
Screen('FinalizeMovie',myMoviePointerThatIMightNeed);
% Close all textures. This is not strictly needed, as
% Screen('CloseAll') would do it anyway. However, it avoids warnings by
% Psychtoolbox about unclosed textures. The warnings trigger if more
% than 10 textures are open at invocation of Screen('CloseAll') and we
% have 12 textues here:
Screen('Close');
% Close window:
Screen('CloseAll');