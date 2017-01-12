from bs4 import BeautifulSoup
import sys
import requests

validID = 0

while validID == 0:
    checker = 0

    psnURL = "https://rocketleaguestats.com/profile/PS4/"
    xboxURL = "https://rocketleaguestats.com/profile/XboxOne/"
    steamURL = "https://rocketleaguestats.com/profile/steam/"

    while checker == 0:
        systemType = input("What system are you on? Press 1 for steam, 2 for PSN, or 3 for Xbox Live")
        if systemType == 1:
            choice = raw_input("Please copy paste your steam custom URL tag or URL ID number")
            checker = 1
        elif systemType == 2:
            choice = raw_input("Please enter your PSN account name")
            checker = 1
        elif systemType == 3:
            choice = raw_input("Please enter your Xbox live account name")
            checker = 1
        else:
            print("Incorrect option. Please choose again")

    if systemType == 1:
        url2 = steamURL + choice
        url = requests.get(url2)
    elif systemType == 2:
        url2 = psnURL + choice
        url = requests.get(url2)
    elif systemType == 3:
        url2 = xboxURL + choice
        url = requests.get(url2)

    url1 = url.content
    soup = BeautifulSoup(url1, 'xml')



    if soup.title.get_text() == "Rocket League Stats: Woops!":
        print("That is not a valid user id")
    else:
        validID = 1




labels = []
final_stats = []
final_array = []

soup.prettify()
stats_table = soup.find_all("table")

for table in stats_table:
    try:
        stat = table.find('tbody')
    except:
        print("that is not a valid username")
for table in stat:
    heyo = stat.find_all('strong')
for each in heyo:
    new = each.get_text()
    labels.append(str(new))

#Find the labels for the stats


#Get the actual data

for table in stat:
    theStats = stat.find_all('td')

for x in theStats[4:8]:
    new = x.get_text()
    final_stats.append(str(new))

for x in theStats[12:16]:
    new = x.get_text()
    final_stats.append(str(new))


#zip the two arrays together
for y,x in zip(labels, final_stats):
        t = (y, x)
        final_array.append(t)



print final_array
