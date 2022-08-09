require 'json'
require 'csv'

ids = [
  "i0LSjNKEzmLWCFO0XIXh",
  "mUtqQUUPh9JCW8Fjmsg0",
  "yymIf9yVXgscTklE1wbW",
  "hBiLbMvazQBPtNnLnDsH",
  "cF0NVtKsRz9GLi0e17iY",
  "nPPfDWONc6jINGAetSuV",
  "WTSmHFvZjpvrC8adLixQ",
  "qPVETguwq3Q0a7ZeaQdW",
  "vSXKEJUROIRLUNKA55e5",
  "OVHFxFrvr79BwOwl6gBj",
  "NqTxXnoe03xlfV5EopeR",
  "j4Cen7Sli7GNRtSHPUYG",
  "LiExYQwOno0gRdd5IrkW",
  "PBgvIHupB9pXjdnJwIz5",
  "pJVizu6lSFZTZfa2jZLC",
]

start_date = Date.parse('2022-06-01')

special_days = {
  start_date => { max: (176..185), min: (44..53), avg: (74..86), rest: (55..62) }, # Game
  start_date + 1 => { max: (160..177), min: (44..53), avg: (74..86), rest: (55..62) }, # Training
  start_date + 2 => { max: (160..177), min: (44..53), avg: (74..86), rest: (55..62) }, # Training
  start_date + 4 => { max: (160..177), min: (44..53), avg: (74..86), rest: (55..62) }, # Training
  start_date + 7 => { max: (176..185), min: (44..53), avg: (74..86), rest: (55..62) }, # Game
  start_date + 9 => { max: (160..177), min: (44..53), avg: (74..86), rest: (55..62) }, # Training
  start_date + 10 => { max: (160..177), min: (44..53), avg: (74..86), rest: (55..62) }, # Training
}

seeds = { max: (120..140), min: (40..50), avg: (60..75), rest: (45..55) }

have_weight = {
  "WTSmHFvZjpvrC8adLixQ" => (78.8..81.1),
  "OVHFxFrvr79BwOwl6gBj" => (83.2..85.3),
  "nPPfDWONc6jINGAetSuV" => (82.2..83.5),
  "LiExYQwOno0gRdd5IrkW" => (93.3..96.4)
}

data = []

(start_date..start_date+14).each do |date|
  ids.each do |id|
    day_data = {
      id: id,
      date: date,
      max_hr: special_days[date].nil? ? rand(seeds[:max]) : rand(special_days[date][:max]),
      min_hr: special_days[date].nil? ? rand(seeds[:min]) : rand(special_days[date][:min]),
      avg_hr: special_days[date].nil? ? rand(seeds[:avg]) : rand(special_days[date][:avg]),
      avg_resting_hr: special_days[date].nil? ? rand(seeds[:rest]) : rand(special_days[date][:rest]),
      weight: have_weight[id].nil? ? nil : rand(have_weight[id]),
      body_fat: nil
    }

    data << day_data
  end
end

File.write('../bio_log_data.json', JSON.dump(data))

