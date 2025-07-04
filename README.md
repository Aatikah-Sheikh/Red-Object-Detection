# ParrotMinidroneRedAlert
Drone Detection and automated email system

This repository contians all code and models for the Parrot Minidrone red object Detection and automated email notification system. 
## Table of Contents
 -[Project Overview](#project-overview)

 -[Files Included](#files-included)
 
 -[Features](#features)
 
 -[Repository Structure](#repository-structure)
 
  -[Requirements](#requirements)
  
  -[How to Use](#how-to-use)
  
 
## Project Overview
The system performs the following:
* Detects a red object during flight in a simulation.
* Captures an image when the object is detected.
* Sends an email with the captured image attached.
* Returns to the start position after detection.
This work was completed as part of **Task 2: Automated Control Signal Notification**, 2025. 

## Features
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
The respository is structured as follows
### Requirements 
- MATLAB with the Parrot Minidrone Support Package Installed.
- Python 3.x with :
  * 'smtplib'
  * 'ssl'
  * 'email'
  * 'os'
  * 'time'
 -(Recommended) A valid Gmail  account and App Password for SMTP Authentication. 

### How to use
Note this project runs in simulation mode only and does not deploy directly onto the drone hardware. 
