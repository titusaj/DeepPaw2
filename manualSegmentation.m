%Titus John
%Leventhal Lab, University of Michigan
%July 8, 2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input
% Video file for a given view of the mask

% Output
% This takes a single video and output the groundtruth paw segmentation
% This can be done manullay or using computer vision segmentation



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function manualSegmentation(video)
    
    %video =  VideoReader(videoFileName);%Read the video into the filspace
    numFrames= video.Duration* video.FrameRate; %calculate the tolat number of frames in the video
    
    count =1; 
    
    for i = 300:numFrames %loop through the frams of the video to extract the
            
        %load the rgb image
            rgbImage = read(video, i);
            h_im = imshow(rgbImage);
            e = imfreehand;
            BW = createMask(e,h_im);
          
            %  filename for rgb image
              rgbFilename = strcat(num2str(count+1040),'.tif');
              rgbImage= imresize(rgbImage, [512, 512]);
              imwrite(rgbImage,rgbFilename);  
              
              %filename for mask of paw
            maskFilename = strcat('1_',num2str(count+1040),'_mask.tif');
            pawMaskLargestBlob = imresize(BW, [512, 512]);
            imwrite(BW,maskFilename); 
              
              count = count + 1;
               
        
     
    end

end
