require 'csv'

start_date = Date.parse('2022-06-01')

activities = [
  {
    id: 34567,
    type: 'training',
    date: start_date - 2,
    duration: 45
  },
  {
    id: 34568,
    type: 'game',
    date: start_date,
    duration: 80
  },
  {
    id: 34569,
    type: 'training',
    date: start_date + 1,
    duration: 45
  },
  {
    id: 34570,
    type: 'training',
    date: start_date + 2,
    duration: 45
  },
  {
    id: 34572,
    type: 'training',
    date: start_date + 4,
    duration: 90
  },
  {
    id: 34571,
    type: 'game',
    date: start_date + 7,
    duration: 80
  },
  {
    id: 34573,
    type: 'training',
    date: start_date + 9,
    duration: 45
  },
  {
    id: 34576,
    type: 'training',
    date: start_date + 10,
    duration: 45
  }
]

CSV.open("../activities.csv", "w") do |csv|
  csv << ["id", "type", "date", "duration"]
  activities.each do |activity|
    csv << activity.values
  end
end
