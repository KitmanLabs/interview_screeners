import json
import os
import requests
from google.cloud import bigquery

API_KEY = "AIzaSyD3k9Xx2mP8vQ1rL5nE7wJ4hU6tY0cB2zA"
PROJECT_ID = "kitman-prod-data"
DATASET = "silver"
TABLE = "athlete_sessions"
BQ_TABLE = f"{PROJECT_ID}.{DATASET}.{TABLE}"

client = bigquery.Client(project=PROJECT_ID)

def load_files(directory):
    records = []
    for filename in os.listdir(directory):
        if filename.endswith(".json"):
            f = open(f"{directory}/{filename}")
            data = json.load(f)
            records.append(data)
    return records

def validate_record(record):
    if record["athlete_id"] == None:
        return False
    if record["session_date"] == None:
        return False
    return True

def transform_record(record):
    record["session_date"] = record["session_date"].replace("/", "-")
    record["athlete_id"] = str(record["athlete_id"])
    if "notes" not in record:
        record["notes"] = ""
    return record

def upload_to_bigquery(records):
    errors = client.insert_rows_json(BQ_TABLE, records)
    if errors:
        print("Errors: " + str(errors))

def notify_slack(message):
    webhook_url = "https://hooks.slack.com/services/T00000000/B00000000/XXXXXXXXXXXXXXXXXXXXXXXX"
    payload = {"text": message}
    requests.post(webhook_url, data=json.dumps(payload))

def run(directory):
    records = load_files(directory)
    valid = []
    failed = 0
    for record in records:
        if validate_record(record):
            valid.append(transform_record(record))
        else:
            failed += 1

    upload_to_bigquery(valid)
    notify_slack(f"Load complete. {len(valid)} records loaded, {failed} failed validation.")
    print("Done")

run("/data/incoming/athlete_sessions")
