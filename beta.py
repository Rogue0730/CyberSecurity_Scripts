admins = []
standardUsers = []

def userGroup_ADMINS():
  # Asks user for admin account
  adminInput = input("Input all of the admins listed in the README (Use commas to seperate,no spaces!): ")
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
    print(admins)
    isAdminsCorrect = input('Is this correct? (Y/N): ')
    if isAdminsCorrect ==  'Y':
      break
    elif isAdminsCorrect == 'N':
      continue
    else: 
      continue
def usergroup_STANDARD():
  # Asks user for admin account
  standInput = input("Input all of the standard users listed in the README (Use commas to seperate,no spaces!): ")
  standInput += ','

  standCache = ""
  # Loops through the admins and adds them to the admin list
  while True:
    for i in range(len(standInput)):
      if standInput[i] != ",":
          standCache += standInput[i]
      elif standInput[i] == ",":
          standardUsers.append(standCache)
          standCache = ""
    # Asks the user if the admins collected are corrects
    print(standardUsers)
    isStandardCorrect = input('Is this correct? (Y/N): ')
    if isStandardCorrect ==  'Y':
      break
    elif isStandardCorrect == 'N':
      continue
    else: 
      continue

def addStandardUser():
  with open('test.txt', 'r') as file:
      line = file.readlines()

  line[3] = 'set authUsers='
  for user in standardUsers:
    if user == standardUsers[0]:
      line[3] += user
    else:
      line[3] += " " + user
  line[3] += "\n"

  with open('test.txt', 'w') as file:
      file.writelines(line)
  print("Added Authorized Users To File.")

def addAdmins():
  with open('test.txt', 'r') as file:
      line = file.readlines()

  line[2] = 'set authAdmins='
  for admin in admins:
    if admin == admins[0]:
      line[2] += admin
    else:
      line[2] += " " + admin
  line[2] += "\n"

  with open('test.txt', 'w') as file:
      file.writelines(line)
  print("Added Authorized Admins To File.")

def clearBATFile():
  with open('test.txt', 'r') as file:
      line = file.readlines()

  line[2] = ' '
  line[3] = ' '

  with open('test.txt', 'w') as file:
      file.writelines(line)
      
clearBATFile()
userGroup_ADMINS()
usergroup_STANDARD()

addStandardUser()
addAdmins()
