# Imports.
import subprocess
import json
import datetime
import os

key = os.environ.get("ESKOM_SE_PUSH_KEY")
region = "westerncape-2-universityofstellenbosch"

command = [ "curl", "--location", "--request", "GET",  
            "https://developer.sepush.co.za/business/2.0/area?id="+region,
            "--header", f"token: {key}" ]

try:
    result = subprocess.run(command, stdout=subprocess.PIPE, stderr = subprocess.DEVNULL).stdout.decode('utf-8')
    if 'error' in result:
        print(" ")
    else:
        current = json.loads(result)["events"][0]
        start = datetime.datetime.fromisoformat(current["start"])
        end = datetime.datetime.fromisoformat(current["end"])
        duration = end - start
        print(start.strftime("%H:%M") + " [" + str(int(duration.total_seconds()/3600)) + "]")

# Could not connect.
except(json.JSONDecodeError):
    print(" ")
