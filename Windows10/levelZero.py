# Stores the admins
admins = []

# Function to get the authorized admins in README file


def userGroup_ADMINS():
    # Asks user for admin account
    adminInput = input(
        "Input all of the admins listed in the README (Use commas to seperate each user, no spaces!): ")
    adminInput += ','

    adminCache = ""
    # Loops through the admins and adds them to the admin list
    for i in range(len(adminInput)):
        if adminInput[i] != ",":
            adminCache += adminInput[i]
        elif adminInput[i] == ",":
            admins.append(adminCache)
            adminCache = ""

    print(admins)


userGroup_ADMINS()
