require "parquet"

schema = {
  athlete_id: :int32,
  email: :string,
  recorded_on: :date64,
  max_speed: :int32,
  moving_time: :int32
}

start_date = Date.parse('2022-06-01')

data = [
  # Game Day
  [1023, "", start_date, rand(3..8), rand(75..85)],
  [1024, "sroy@chasers.com", start_date, rand(3..8), rand(75..85)],
  [1025, "connor@chasers.com", start_date, rand(3..8), rand(75..85)],
  [2467, "", start_date, rand(3..8), rand(75..85)],
  [1890, "", start_date, rand(3..8), rand(75..85)],
  [1764, "oscar@chasers.com", start_date, rand(3..8), rand(75..85)],
  [4675, "", start_date, rand(3..8), rand(75..85)],
  [5004, "", start_date, rand(3..8), rand(75..85)],
  [5005, "", start_date, rand(3..8), rand(75..85)],
  [5006, "damian9205@chasers.com", start_date, rand(3..8), rand(75..85)],

  # Training Day
  [1023, "", start_date+2, rand(2..4), rand(45..65)],
  [1024, "sroy@chasers.com", start_date+2, rand(2..4), rand(45..65)],
  [1025, "connor@chasers.com", start_date+2, rand(2..4), rand(45..65)],
  [1027, "mannix@chasers.com", start_date+2, rand(2..4), rand(45..65)],
  [2467, "", start_date+2, rand(2..4), rand(45..65)],
  [1890, "", start_date+2, rand(2..4), rand(45..65)],
  [4675, "", start_date+2, rand(2..4), rand(45..65)],
  [5001, "gary1765@chasers.com", start_date+2, rand(2..4), rand(45..65)],
  [5004, "", start_date+2, rand(2..4), rand(45..65)],
  [5006, "damian9205@chasers.com", start_date+2, rand(2..4), rand(45..65)],

  # Training Day
  [1023, "", start_date+4, rand(2..4), rand(45..65)],
  [1024, "sroy@chasers.com", start_date+4, rand(2..4), rand(45..65)],
  [1025, "connor@chasers.com", start_date+4, rand(2..4), rand(45..65)],
  [1027, "mannix@chasers.com", start_date+4, rand(2..4), rand(45..65)],
  [2467, "", start_date+4, rand(2..4), rand(45..65)],
  [1890, "", start_date+4, rand(2..4), rand(45..65)],
  [5001, "gary1765@chasers.com", start_date+4, rand(2..4), rand(45..65)],
  [5004, "", start_date+4, rand(2..4), rand(45..65)],
  [5005, "", start_date+4, rand(2..4), rand(45..65)],
  [5006, "damian9205@chasers.com", start_date+4, rand(2..4), rand(45..65)],

  # Game Day
  [1023, "", start_date+7, rand(3..8), rand(75..85)],
  [1025, "connor@chasers.com", start_date+7, rand(3..8), rand(75..85)],
  [1027, "mannix@chasers.com", start_date+7, rand(3..8), rand(75..85)],
  [2467, "", start_date+7, rand(3..8), rand(75..85)],
  [1890, "", start_date+7, rand(3..8), rand(75..85)],
  [4675, "", start_date+7, rand(3..8), rand(75..85)],
  [5001, "gary1765@chasers.com", start_date+7, rand(3..8), rand(75..85)],
  [5004, "", start_date+7, rand(3..8), rand(75..85)],
  [5005, "", start_date+7, rand(3..8), rand(75..85)],
  [5006, "damian9205@chasers.com", start_date+7, rand(3..8), rand(75..85)],

  # Training Day
  [1023, "", start_date+9, rand(2..4), rand(45..65)],
  [1024, "sroy@chasers.com", start_date+9, rand(2..4), rand(45..65)],
  [1025, "connor@chasers.com", start_date+9, rand(2..4), rand(45..65)],
  [1027, "mannix@chasers.com", start_date+9, rand(2..4), rand(45..65)],
  [2467, "", start_date+9, rand(2..4), rand(45..65)],
  [1764, "oscar@chasers.com", start_date+9, rand(2..4), rand(45..65)],
  [4675, "", start_date+9, rand(2..4), rand(45..65)],
  [5001, "gary1765@chasers.com", start_date+9, rand(2..4), rand(45..65)],
  [5004, "", start_date+9, rand(2..4), rand(45..65)],
  [5006, "damian9205@chasers.com", start_date+9, rand(2..4), rand(45..65)],
]

table = Arrow::Table.new(schema, data)

table.save("../gps_analyzer_data.parquet")