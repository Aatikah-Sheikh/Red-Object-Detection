%% Define model name
modelName = 'parrotMinidroneCompetition';  % Update if needed

%% Load the model
disp('Loading model...');
load_system(modelName);

%% Configure simulation
disp('Configuring simulation...');
set_param(modelName, 'SimulationMode', 'normal');
set_param(modelName, 'StopTime', 'inf');  % or use a specific stop time

%% Start simulation
disp('Starting simulation...');
set_param(modelName, 'SimulationCommand', 'start');
disp('Simulation command sent.');

%% Initialise detection flag
redDetectedFlag = false;

%% Main loop: Poll workspace variable
disp('Polling for red object detection...');
while true
    % Check simulation status
    simStatus = get_param(modelName, 'SimulationStatus');
    
    if strcmp(simStatus, 'stopped')
        disp('Simulation ended.');
        break;
    end
    
    % Check if 'out' exists in base workspace
    if evalin('base', 'exist(''out'',''var'')')
        s = evalin('base','out');
        
        % Only act if red detected and not yet triggered
        if s.isRedDetected == 1 && ~redDetectedFlag
            disp('Red detected! Saving frame and sending email...');
            
            % Save frame and path to where the image is saved
            imwrite(uint8(s.RedImage), 'C:\Users\Aatikah.Sheikh\MATLAB\Projects\examples\parrotMinidroneCompetition5\LiveFrame.jpg');
            disp('Frame saved as LiveFrame.jpg');
            %pause(10); ---> Add if needed
           
            maxWait = 5;
            waited = 0;
            while ~isfile('C:\Users\Aatikah.Sheikh\MATLAB\Projects\examples\parrotMinidroneCompetition5\LiveFrame.jpg')
                pause(0.2);
                waited = waited +0.2;
                if waited >= maxWait
                    error('Image file did not appear.');
                end
            end
            % Display the image
            figure, imshow(uint8(s.RedImage)), title('Captured Frame');
            
            % Call Python email trigger
            try
                py.red_alert.trigger_alert();
                disp('Email sent successfully.');
            catch pyErr
                disp('Error sending email:');
                disp(pyErr.message);
            end
            
            % Set flag so this only happens once
            redDetectedFlag = true;
        end
    end
    
    pause(0.2);  % Polling interval (0.2s)
end

disp('Script completed.');