# ParrotMinidroneRedAlert
Drone Detection and automated email system

This repository contians all code and models for the Parrot Minidrone red object Detection and automated email notification system. 

## Project Overview
The system performs the following:
* Detects a red object during flight in a simulation.
* Captures an image when the object is detected.
* Sends an email with the captured image attached.
* Returns to the start posiition after detection.
This work was completed as part of **Task 2: Automated Control Signal Notification**, 202. 

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
    * 
 
## Requirements 
- MATLAB with the Parrot Minidrone Support Package Installed.
- Python 3.x with :
  * 'smtplib'
  * 'ssl'
  * 'email'
  * (Recommended) A Gmail App Password configured. 

## How to use
Note this project runs in simulation mode only and does not deploy directly onto the drone hardware. 
