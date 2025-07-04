import numpy as np
import ssl
from datetime import datetime
import time
from email.message import EmailMessage
import smtplib
import os

#Email Configuration - update these before use
# Your sender email
EMAIL_SENDER = 'Add your email'
#Need to setup 2FA - app password
EMAIL_PASSWORD = 'Add your app password' 
# Receiver email adress
EMAIL_RECEIVER = 'Add the receiver email'

#Attach image and send email
def send_email_with_attachment(subject,body,image_path):
  
    msg = EmailMessage()
    msg ['From'] = EMAIL_SENDER
    msg ['To'] = EMAIL_RECEIVER
    msg ['Subject'] = subject 
    msg.set_content(body)
    
# Attach image
    with open (image_path ,'rb') as f:
      image_data = f.read()
      msg.add_attachment(image_data ,maintype = 'image', subtype ='jpeg',filename= 'LiveFrame.jpg')
      
      #Create a secure SSL context
      context = ssl.create_default_context()

    # Connect to the SMTP server and send the email
    with smtplib.SMTP_SSL ('smtp.gmail.com',465) as smtp:
       smtp.ehlo()
       #smtp.starttls()not needed for SSL connection 
       smtp.login(EMAIL_SENDER, EMAIL_PASSWORD)
       smtp.send_message(msg)
       print("Email sent with image attachment")

def trigger_alert():

  # Path to the image that MATLAB saves
  # Don't forget to change the path to where your model is and add the picture name at the end
  image_path = r"C:\Users\Aatikah.Sheikh\MATLAB\Projects\examples\parrotMinidroneCompetition5\LiveFrame.jpg"

  #Debugging steps to ensure the script is running correctly
  print ("Script Started")
  print("Checking path:", image_path)
  print("exists:",os.path.exists(image_path))
  print("Access R_OK",os.access(image_path, os.R_OK))
  print("Current Working Directory:", os.getcwd())
  print("Directory Listing:")
  print(os.listdir(os.path.dirname(image_path)))
  timeout = 10
  start_time = time.time()

  subject = "ALERT"
  body = ("A red object has been detected. \n\n" 
          "\n\n"
  " Regards, \n\n" 
  "Your friendly neighbourhood Drone")
  
  #Send the email
  send_email_with_attachment(subject,body,image_path)

#Entry Point
if __name__ == "__main__":
   trigger_alert()





6