from subprocess import Popen

# Stores the admins
admins = []

# Function to run the main.bat file when called
def runMainBat():
    p = Popen("main.bat", cwd= # Abosolute File Path Here)
    stdout, stderr = p.communicate()

# Function to get the authorized admins in README file
def userGroup_ADMINS():
  # Asks user for admin account
  adminInput = input("Input all of the admins listed in the README (Use commas to seperate each user, no spaces!): ")
  adminInput += ','
  
  adminCache = ""
  # Loops through the admins and adds them to the admin list
  while True:
    for i in range(len(adminInput)):
      if adminInput[i] != ",":
          adminCache += adminInput[i]
      elif adminInput[i] == ",":
          admins.append(adminCache)
          adminCache = ""
    # Asks the user if the admins collected are corrects
    print(admins_
    isAdminsCorrect = input('Is this correct? (Y/N): ')
    if isAdminsCorrect = 'Y':
      break
    elif isAdminsCorrect == 'N':
      continue
    else: 
      continue
    
runMainBat()
