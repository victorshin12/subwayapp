import time
import numpy as np
import requests
from bs4 import BeautifulSoup
import re
import numpy

stationID = 4210

url = f'https://www.seoulmetro.co.kr/kr/getStationInfo.do?action=time&stationId={stationID}'

headers = {
    'User-Agent': 'Victor Shin',
    'From': 'victorshin1230@gmail.com'  # This is another valid field
}

html_text = requests.get(url, headers=headers).text
soup = BeautifulSoup(html_text, "lxml")

def parse_string(s, updownID):
    # Define a regular expression pattern to match the required information
    pattern = r'(\d{2}:\d{2})분 \((.*?)\)( \(급행\))?'

    # Use re.search to find the pattern in the input string
    match = re.search(pattern, s)

    if match:
        time = match.group(1)
        path = match.group(2)
        express = 1 if match.group(3) else 0
    else:
        time = ""
        path = ""
        express = 0

    # Initialize default values
    station_id = stationID
    updown_id = updownID

    # Create and return a new array with the extracted values
    return [station_id, updown_id, path, time, express]

# --------------------------------------

def getTimes(html_tbody, updownID):
    array = []
    hours_tree = html_tbody.find_all("tr")
    for hours_tree_eachhour in hours_tree:
        hour = hours_tree_eachhour.th.text
        hours_list = hours_tree_eachhour.find_all("li")
        for hours_list_value in hours_list:
            a_elements = hours_list_value.find_all("a", inouttag=updownID)
            for a_value in a_elements:
                temp_string = f"{hour}:{a_value.text}"
                final_string = parse_string(temp_string, updownID)
                array.append(final_string)
    return array


# each TR .tr of weekday is each hour from 5am~
# from weekday list, find all tr (timetable of each hour)
# then in each tr, find all li associated with it (each li is time)
#change to find_all to get all hours (code below is only for 5am)

weekday = soup.find("div", class_="tableScrollWrap t1 active").table.tbody
# saturday = soup.find("div", class_="tableScrollWrap t2").table.tbody
# sunday = soup.find("div", class_="tableScrollWrap t3").table.tbody

weekdayUp = np.asmatrix(getTimes(weekday, 1))
# weekdayDown = np.asmatrix(getTimes(weekday, 2))
# saturdayUp = np.asmatrix(getTimes(saturday, 1))
# saturdayDown = np.asmatrix(getTimes(saturday, 2))
# sundayUp = np.asmatrix(getTimes(sunday, 1))
# sundayDown = np.asmatrix(getTimes(sunday, 2))

np.savetxt("weekdayUpData.csv", weekdayUp, fmt='%s', delimiter=",")