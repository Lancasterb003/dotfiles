import requests
from bs4 import BeautifulSoup

page = requests.get("http://192.168.1.1/cgi-bin/luci")

soup = BeautifulSoup(page.content, 'html.parser')

try:
    html = soup.find_all('span')[4].get_text()

    print(html[25:31])

except:
    print('00:00')
