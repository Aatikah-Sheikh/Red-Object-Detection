# ParrotMinidroneRedAlert
Drone Detection and automated email system

This repository contains all code and models for the Parrot Minidrone red object detection and automated email notification system. 
## Table of Contents
 -[Project Overview and Features](#project-overview-and-features)

 -[Files Included](#files-included)
 
 -[Repository Structure](#repository-structure)
 
  -[Requirements](#requirements)
  
  -[How to Use](#how-to-use)
  
 
## Project Overview and Features
The system performs the following:
* Detects a red object during flight in a simulation.
* Captures an image when the object is detected.
* Sends an email with the captured image attached.
* Returns to the start position after detection.
This work was completed as part of **Vacation Work, Task 2: Automated Control Signal Notification**, 2025. 

## Files Included
- 'run_flight_live.m':
  * It is the main MATLAB script.
  * Starts the simulation.
  * Detects the red object.
  * Saves the image
  * Calls the python script to email the image.
    
- 'red_alert.py':
  * This is the python script.
  * Waits for the saved image.
  * Sends an email notification with the image attached.

- 'parrotMinidroneCompetition.slx':
  * Simulink model file for path planning, image processing, and control logic.

- 'test.m':
   * (Optional) Script for visualising and testing image channels and red masks.
      
- 'waypoints.csv'
   * Helps build the track for path planning.
     
## Repository Structure
The respository is structured as follows:
### Requirements 
- MATLAB 2023b (Recommended) with the following MathWorks packages:
  * Simulink
  * Stateflow
  * Image Processing
- Mambo Parrot Minidrone Support Packages.
- Python 3.x must be compatible with your installed version of MATLAB and accessible within MATLAB.

  Link to check compatibility: https://www.mathworks.com/support/requirements/python-compatibility.html
  
- Python should be installed with the following packages:
  * 'smtplib'
  * 'ssl'
  * 'email'
  * 'os'
  * 'time'

 - A valid Gmail  account and App Password for SMTP Authentication (Recommended).

### How to use
**Note** this project runs in simulation mode only and does not deploy directly onto the drone hardware. 
1. **Clone or download** this repository.
2. Open MATLAB and set the working directory to the repository folder.
3. Load your waypoint data file (csv).
4. **Important: Waypoint Data Setup** Before running the script, you must import the waypoint data and assign it to a numeric matrix variable. From there you then create a variable for example U = waypoints in the command window.

![Waypoint Data Import](https://github.com/aatikah21/ParrotMinidroneRedAlert/blob/main/images/Screenshot%202025-07-04%20094123.png)

5. Once the points are loaded, the virtual world for the simulation needs to be uploaded. 

![Updating the Virtual World](https://github.com/aatikah21/ParrotMinidroneRedAlert/blob/main/images/Screenshot%202025-07-04%20102842.png)

6. Configure the python email script:
   * Open 'red_alert.py'
   * Locate the email configuration section.
 
 ![Python Code to edit](https://github.com/aatikah21/ParrotMinidroneRedAlert/blob/main/images/Screenshot%202025-07-04%20102046.png)
 
     - Replace these values with the Gmail address you want to send from.
     - The Gmail App Password (not your normal password).
     - The recipient's email.
7. Ensure your Python environment is set up and all required packages are installed. 
8. In MATLAB, open 'run_flight_live.m'.
9. Click Run to start the simulation.
10. Check your email inbox to confirm receipt of the alert with the image attachment.

## Troubleshooting
-**Python module errors:** Make sure your Python environment is visible to MATLAB ('pyenv').

-**Email not sending:** 
    *Confirm you set up an App Password and allowed less secure apps.
    * In simulation settings make sure 'Single SImulation Output' is unticked.
    
 -**Simulation errors:** Check if all MATLAB toolboxes are installed. 

