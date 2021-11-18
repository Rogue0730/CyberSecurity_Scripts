import os

# Stores the admins
admins[]

# Asks user for admin account
admin = input("Input all of the admins listed in the README (use commas to seperate each user, no spaces!): ")
admin += ','

# Loops through the admins and adds them to the admin list
adminCache = ""
for i in len(admin):
    if i != ",":
        adminCache += i
    elif i == ",":
        admins.append(adminCache)
        adminCache = ""

