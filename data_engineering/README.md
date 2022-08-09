# Data Engineering Task

Welcome to the Kitman Labs Data Engineering take home test. Find your task below. Also find attached below the task description a data dictionary that you can use as a reference as your progress through the task. Have fun!

## Task Description

Your task is split into two part detailed below. To complete this task, you can use any language you feel comfortable with. The outputs of each task are going to be some data files with values in them. Your solution should contain your code, instructions for building & running it, as well as the output files. You are not required to write unit tests (you can if you want). However, please ensure your code is well structured and easy to read/understand.

### Part 1

You have been provided with a set of data files representing internal and thirdparty data (please read the data dictionary below before starting the task). The goal of this exercise is to combine the internal and thirdparty data into one dataset for use in analysis. We will call this dataset the "athlete day table" (ADT), for which there should be one row per athlete (in the athletes file) per day (between the date range 2022-06-01 to 2022-06-15 inclusive).

#### Part 1 - a

Use the data provided to generate an ADT and export it as a CSV file (remember to include this along side your code in your solution submissions).

Include whatever data you think would be useful for analysis in the ADT. However, ensure at a minimum that the ADT you generate have the required information to answer the following questions:

- Was there a game on this day?
- Was there a training session on this day?
- Did the athlete participate in a game on this day?
- Did the athlete participate in a training session on this day?
- Is the athletes weight within 5% of it's ideal value on this day?
- What was the athletes max heart rate on this day?
- How much time did an athlete spend moving on this day?

#### Part 1 - b

Using your generated ADT, write some code to answer the following questions (please output the answers to a file and include this along side your code in your solution submissions):
  
- What was the average max heart rate for each athlete on days where the athlete participated in a training session?
- Which athlete(s) accumulated the most moving time during games?

### Part 2

Given that no system will ever having perfect data quality, it is important to understand the quality of data both internally and externally. Given the internal and thirdparty data provided, what kind of data health issues are present?

From looking at the data what (if any) data issues did you notice in either the internal or thirdparty data? Were there any inconsistencies between the internal and thirdparty data? (please write your answers to the above in a file and include this along side your code in your solution submissions)

#### Bonus

Write some code that can look at the data (either the ADT or raw source) and can generate a "data health score" in an automated fashion. This is a bonus exercise and so any definition of a "data health score" is fine.

## Data Dictionary

There are two main types of data in the described system, `Internal` and `Thirdparty` data. It should be noted that the data in the Internal files should be considered as the source of truth for the purposes of the exercise (part 1). With that said, that does not mean that there are not issues present in this data which you might discover especially with reference to the `Thirdparty` data (part 2).

### Internal Data

`activities.csv`

This is a list of activities in the system. Activities are a generic object that can represent either a game or training session that happened on a specific date as well as the duration of the activity.

| field | data_type |
| --- | --- |
| id | `integer`, unique id for an activity|
| type| `string`, one of either [`game`, `training`] denoting if an activity was a game or training session|
| date| `date`, date of the activity in the format `yyyy-mm-dd` |
| duration| `integer`, duration of an activity in minutes |

---

`athlete_activities.csv`

This is a link table which links an athlete and an activity denoting that an athlete participated in a given activity.

| field | data_type |
| --- | --- |
| athlete_id | `integer`, unique id for an athlete|
| activity_id | `integer`, unique id for an activity|

---

`athlete_provider_mapping.csv`

This is a link table which links an athletes internal id to the unique identifier from a specific thirdparty vendor.

| field | data_type |
| --- | --- |
| athlete_id | `integer`, unique id for an athlete|
| provider | `string`, unique key for referencing a specific thirdparty vendor|
| external_id | `string`, unique id for an athlete from a specific thirdparty vendor|

---

`athletes.csv`

This is a list of all athletes in the system. This is the source of truth for athletes and only data corresponding to these athletes should be present in the system.

| field | data_type |
| --- | --- |
| id | `integer`, unique id for an athlete |
| first_name | `string`, athletes first name |
| last_name | `string`, athletes last name |
| dob | `date`, date of birth of the athlete in the format `yyyy-mm-dd` |
| email | `string`, email address of the athlete |
| weight | `integer`, ideal target weight of an athlete |

---

### Thirdparty Data

`bio_log_data.json`

Biometric data collected daily from athletes via the thirdparty vendor "Bio Log" know in our system as `bio_log`.

| field | data_type |
| --- | --- |
| id | `string`, unique id for an athlete in the Bio Log system. |
| date | `date`, date of the data recording in the format `yyyy-mm-dd` |
| max_hr | `integer`, max recorded heart rate for an athlete on the date of recording |
| min_hr | `integer`, min recorded heart rate for an athlete on the date of recording |
| avg_hr | `integer`, average heart rate for an athlete on the date of recording |
| avg_resting_hr | `integer`, average resting heart rate for an athlete on the date of recording |
| weight | `decimal`, weight of the athlete in kilograms on the date of recording |
| body_fat | `decimal`, percentage body fat of the athlete on the date of recording |

---

`gps_analyzer_data.parquet`

GPS tracking data collected during games and training sessions via the thirdparty vendor "GPSAnalyzer" know in our system as `gps_analyzer`.

| field | data_type |
| --- | --- |
| athlete_id | `integer`, unique id for an athlete in the GPSAnalyzer system. |
| email | `string`, email address of the athlete in the GPSAnalyzer system. |
| recorded_on | `date`, date of the data recording in the format `yyyy-mm-dd` |
| max_speed | `integer`, max recorded speed for an athlete in m/s |
| moving_time | `integer`, total moving time recorded for an athlete in minutes |

---
